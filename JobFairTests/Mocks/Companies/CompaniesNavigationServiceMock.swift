import Quick
import Nimble
@testable import JobFair

class CompaniesNavigationServiceMock: CompanyNavigationService {
    var didNavigateToCompanyFilter = false
    var didNavigateToCompanyDetails = false
    var didShowErrorAlert = false
    var didShowCompanyDetail = false
    var didDismiss = false
    var didShowMapViewController = false
    var didOpenURL = false
    
    override func dismiss() {
        didDismiss = true
    }
    
    override func navigateToCompanyFilter(companyFilterViewControllerDelegate: CompanyFilterViewControllerDelegate, currentIndustryId: String) {
        didNavigateToCompanyFilter = true
    }
    
    override func navigateToCompanyDetails(at index: Int, companies: [CompanyViewModel]) {
        didNavigateToCompanyDetails = true
    }

    override func showErrorAlert(retryCompletion: (() -> Void)?) {
        didShowErrorAlert = true
    }

    override func showCompanyDetailsViewController(for company: CompanyViewModel) {
        didShowCompanyDetail = true
    }

    override func showMapViewController(highlightedCompanyId: String) {
        didShowMapViewController = true
    }
    
    override func open(_ url: URL) {
        didOpenURL = true
    }
}
