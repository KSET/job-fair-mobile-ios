import Quick
import Nimble
@testable import JobFair

class InfoViewControllerMock: InfoViewController {
    var didSetInfo = false
    
    override var info: [InfoViewModel] {
        didSet {
            didSetInfo = true
        }
    }
}
