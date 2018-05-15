import Quick
import Nimble
@testable import JobFair

class CompanyListPresenterMock: CompanyListPresenter {
    var didShowCompanies = false
    
    override func showCompanies(_ companies: [Company]?, industryId: String) {
        didShowCompanies = true
    }
}
