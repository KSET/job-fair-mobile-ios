import Foundation

class CompanyListPresenter {
    unowned private let viewController: CompanyListViewController
    
    init(viewController: CompanyListViewController) {
        self.viewController = viewController
    }
    
    func showCompanies(_ companies: [Company]?, industryId: String) {
        guard let companies = companies else {
            return
        }
        let newCompanies = companies.compactMap { CompanyViewModel(company: $0) }
        let currentCompanies = CurrentCompanies(companies: newCompanies, currentIndustryId: industryId)
        viewController.currentCompanies = currentCompanies
    }
    
    func showLoadingView() {
        viewController.showLoadingView()
    }
    
    func removeLoadingView() {
        viewController.removeLoadingView()
    }
    
    func showError() {
        viewController.showError()
    }
}

struct CurrentCompanies {
    let companies: [CompanyViewModel]
    let currentIndustryId: String
}
