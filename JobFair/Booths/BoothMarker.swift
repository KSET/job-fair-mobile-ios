import Foundation
import GoogleMaps

class BoothMarker: GMSMarker {

    let booth: BoothViewModel
    private let logoImageView = UIImageView(frame: .init(x: 0, y: 0, width: 20, height: 20))

    init(booth: BoothViewModel) {
        self.booth = booth
        super.init()
        setMarker(with: booth)
    }

    private func setMarker(with booth: BoothViewModel) {
        position = booth.geolocation.coordinates
        logoImageView.kf.setImage(with: booth.company.logoUrl, placeholder: #imageLiteral(resourceName: "placeholder"))

        title = booth.company.name
        groundAnchor = CGPoint(x: 0.5, y: 0.5)
        iconView = logoImageView
        tracksViewChanges = true
    }
}
