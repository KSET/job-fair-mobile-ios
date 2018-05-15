import Quick
import Nimble
@testable import JobFair

class CompanyListViewControllerMock: CompanyListViewController, CompanyFilterViewControllerDelegate {
    var didSetCompanies = false
    var didShowLoadingView = false
    var didShowError = false
    
    override var currentCompanies: CurrentCompanies? {
        didSet {
            didSetCompanies = true
        }
    }

    override func showError() {
        didShowError = true
    }
    
    func didSelectIndustry(_ industryId: String) {
        
    }
}
