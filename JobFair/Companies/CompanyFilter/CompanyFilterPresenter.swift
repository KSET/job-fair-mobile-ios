import Foundation

class CompanyFilterPresenter {
    unowned private let viewController: CompanyFilterViewController
    
    init(viewController: CompanyFilterViewController) {
        self.viewController = viewController
    }
    
    func showIndustries(_ industries: [Industry]) {
        var newIndustries = industries.compactMap { IndustryViewModel(industry: $0) }
        let allIndustries = IndustryViewModel(id: Constants.Common.defaultId, name: Constants.Industries.all)
        newIndustries.insert(allIndustries, at: 0)
        viewController.industries = newIndustries
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
