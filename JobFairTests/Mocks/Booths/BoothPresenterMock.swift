import Foundation
@testable import JobFair

class BoothPresenterMock: BoothPresenter {
    var didShowError = false
    var didShowBooths = false

    func showError() {
        didShowError = true
    }

    func show(booths: [Booth]) {
        didShowBooths = true
    }
}
