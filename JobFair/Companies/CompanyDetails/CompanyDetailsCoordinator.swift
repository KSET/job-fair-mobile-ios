import UIKit

class CompanyDetailsCoordinator {
    var navigationService: CompanyNavigationService
    
    init(navigationController: UINavigationController?) {
        self.navigationService = CompanyNavigationService(navigationController: navigationController)
    }
    
    func didSelectOpenURLAction(websiteUrlString: String) {
        guard let url = URL(string: websiteUrlString) else {
            return
        }
        navigationService.open(url)
    }

    func didTapBoothLocationButton(companyId: String) {
        navigationService.showMapViewController(highlightedCompanyId: companyId)
    }
}
