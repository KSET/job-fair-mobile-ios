import UIKit
import GoogleMaps

class BoothsViewController: UIViewController {

    private let initialZoom: Float = 20
    private let maxZoom: Float = 21
    private let northEastMapBound = CLLocationCoordinate2D(latitude: 45.8015, longitude: 15.97155)
    private let southWestMapBound = CLLocationCoordinate2D(latitude: 45.8001, longitude: 15.9705)
    private let jobFairLocation = CLLocationCoordinate2D(latitude: 45.8011031, longitude: 15.9710031)
    private let overlayImageSouthWest = CLLocationCoordinate2D(latitude: 45.800015, longitude: 15.970431)
    private let overlayImageNorthEast = CLLocationCoordinate2D(latitude: 45.801461, longitude: 15.97194)

    private var coordinator: MapCoordinator!
    private let highlightedCompanyId: String?
    private let targetPosition: CLLocationCoordinate2D?

    private lazy var camera = GMSCameraPosition.camera(withTarget: jobFairLocation, zoom: initialZoom, bearing: 85.9, viewingAngle: 0)
    private lazy var mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)

    init(highlightedCompanyId: String? = nil) {
        self.highlightedCompanyId = highlightedCompanyId
        targetPosition = nil
        super.init(nibName: nil, bundle: nil)
    }
    
    init(targetPosition: CLLocationCoordinate2D) {
        highlightedCompanyId = nil
        self.targetPosition = targetPosition
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.Map.title
        coordinator = MapCoordinator(viewController: self)
        addMapView()
        addOverlayImage()
        coordinator?.viewDidLoad()
    }

    func showMarkers(for booths: [BoothViewModel]) {
        booths.forEach { booth in
            let marker = BoothMarker(booth: booth)
            marker.map = mapView
            highlightMarketIfNeeded(marker: marker)
            showTargetPositionIfNeeded()
        }
    }

    func showError() {
        coordinator.didGetError()
    }

    private func addMapView() {
        mapView.settings.tiltGestures = false
        mapView.isBuildingsEnabled = false
        mapView.settings.rotateGestures = false
        mapView.setMinZoom(initialZoom, maxZoom: maxZoom)
        mapView.cameraTargetBounds = GMSCoordinateBounds(coordinate: northEastMapBound,
                                                         coordinate: southWestMapBound)
        mapView.delegate = self
        loadCustomMapStyle()
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                mapView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor),
                mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        )
    }

    private func addOverlayImage() {
        let overlayBounds = GMSCoordinateBounds(coordinate: overlayImageSouthWest, coordinate: overlayImageNorthEast)
        let overlay = GMSGroundOverlay(bounds: overlayBounds, icon: #imageLiteral(resourceName: "fair_layout"))
        overlay.map = mapView
    }

    private func highlightMarketIfNeeded(marker: BoothMarker) {
        if marker.booth.company.id == highlightedCompanyId {
            mapView.selectedMarker = marker
            mapView.animate(with: GMSCameraUpdate.setTarget(marker.position, zoom: maxZoom))
        }
    }
    
    private func showTargetPositionIfNeeded() {
        if let targetPosition = targetPosition {
            let targetMarker = GMSMarker(position: targetPosition)
            targetMarker.map = mapView
            mapView.animate(with: GMSCameraUpdate.setTarget(targetPosition, zoom: maxZoom))
        }
    }

    private func loadCustomMapStyle() {
        do {
            if let styleURL = Bundle.main.url(forResource: "map_style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find map_style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
    }
}

extension BoothsViewController: GMSMapViewDelegate {

    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        guard let marker = marker as? BoothMarker else {
            return
        }

        coordinator.didTapOnCompanyMarker(with: marker.booth.company)
    }
}
