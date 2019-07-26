import Foundation
@testable import JobFair

class MapViewControllerMock: BoothsViewController {
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
