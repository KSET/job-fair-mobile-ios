import Quick
import Nimble
@testable import JobFair

class InfoPresenterMock : InfoPresenter {
    var didShowInfo = false
    
    override func showInfo() {
        didShowInfo = true
    }
}
