import Foundation
@testable import JobFair

class BoothStoreMock: BoothStore {
    var didShowBooths = false

    override func showBooths(with presenter: BoothPresenter) {
        didShowBooths = true
    }
}
