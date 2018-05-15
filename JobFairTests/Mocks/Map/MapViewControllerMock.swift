import Foundation
@testable import JobFair

class MapViewControllerMock: MapViewController {
    var didShowError = false
    var didShowBooths = false

    override func viewDidLoad() {
    }

    override func showMarkers(for booths: [BoothViewModel]) {
        didShowBooths = true
    }

    override func showError() {
        didShowError = true
    }
}
