import UIKit
import SafariServices

class CompanyNavigationService: BaseNavigationService {
    
    func navigateToCompanyFilter(companyFilterViewControllerDelegate: CompanyFilterViewControllerDelegate, currentIndustryId: String) {
        let companyFilterViewController = CompanyFilterViewController(companyFilterViewControllerDelegate: companyFilterViewControllerDelegate, currentIndustryId: currentIndustryId)
        let companyFilterNavigationController = UINavigationController(rootViewController: companyFilterViewController)
        navigationController?.present(companyFilterNavigationController, animated: true, completion: nil)
    }
    
    func navigateToCompanyDetails(at index: Int, companies: [CompanyViewModel]) {
        let companiesPagerViewController = CompanyPagerViewController(companyIndex: index, companies: companies)
        let jobFairPager = JobFairPageViewController(pager: companiesPagerViewController)
        navigationController?.pushViewController(jobFairPager, animated: true)
    }

    func showCompanyDetailsViewController(for company: CompanyViewModel) {
        let companyDetailsViewController = CompanyDetailsViewController(company: company)
        navigationController?.pushViewController(companyDetailsViewController, animated: true)
    }

    func showMapViewController(highlightedCompanyId: String) {
        let mapViewController = MapViewController(highlightedCompanyId: highlightedCompanyId)
        navigationController?.pushViewController(mapViewController, animated: true)
    }
}
