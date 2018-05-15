import Quick
import Nimble
import RxSwift
@testable import JobFair

class CompanyFilterPresenterMock: CompanyFilterPresenter {
    var didShowIndustries = false
    
    override func showIndustries(_ industries: [Industry]) {
        didShowIndustries = true
    }
}
