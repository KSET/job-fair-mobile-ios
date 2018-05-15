import Foundation

class MapPresenter: BoothPresenter {

    unowned var viewController: MapViewController

    init(viewController: MapViewController) {
        self.viewController = viewController
    }

    func showError() {
        viewController.showError()
    }

    func show(booths: [Booth]) {
        let boothsViewModel = booths.map { BoothViewModel(booth: $0) }
        viewController.showMarkers(for: boothsViewModel)
    }
}
