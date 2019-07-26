import UIKit
import RxSwift

class CompanyListCoordinator {
    var store: CompanyStore
    var navigationService: CompanyNavigationService
    private let presenter: CompanyListPresenter
    private let gateway: CompanyGateway
    
    init(viewController: CompanyListViewController,
         navigationController: UINavigationController?,
         gateway: CompanyGateway = CompanyGateway(),
         store: CompanyStore = CompanyStore()) {
        self.presenter = CompanyListPresenter(viewController: viewController)
        self.navigationService = CompanyNavigationService(navigationController: navigationController)
        self.gateway = gateway
        self.store = store
    }
    
    func viewDidLoad(industryId: String) {
        store.showCompanies(for: industryId, presenter: presenter)
    }
    
    func didSelectCompany(_ companies: [CompanyViewModel], index: Int) {
        navigationService.navigateToCompanyDetails(at: index, companies: companies)
    }

    func didGetError(for industryId: String) {
        navigationService.showErrorAlert { [weak self] in
            self?.viewDidLoad(industryId: industryId)
        }
    }
    
    func didSelectIndustry(_ industryId: String) {
        store.showCompanies(for: industryId, presenter: presenter)
    }
}
