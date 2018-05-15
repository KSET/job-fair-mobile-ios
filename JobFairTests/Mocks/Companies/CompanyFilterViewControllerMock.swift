import Quick
import Nimble
import RxSwift
@testable import JobFair

class CompanyFilterViewControllerMock: CompanyFilterViewController {
    var didSetIndustries = false
    var didShowError = false
    
    override var industries: [IndustryViewModel] {
        didSet {
            didSetIndustries = true
        }
    }

    override func showError() {
        didShowError = true
    }
}
