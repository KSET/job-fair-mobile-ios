import UIKit

class CompanyFilterCoordinator {
    var presenter: CompanyFilterPresenter
    var navigationService: CompanyNavigationService
    var useCase: CompanyFilterUseCase
    
    init(viewController: CompanyFilterViewController,
         navigationController: UINavigationController?,
         useCase: CompanyFilterUseCase = CompanyFilterUseCase()) {
        self.presenter = CompanyFilterPresenter(viewController: viewController)
        self.navigationService = CompanyNavigationService(navigationController: navigationController)
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        useCase.fetchIndustries(presenter: presenter)
    }
    
    func didSelectDismissAction() {
        navigationService.dismiss()
    }

    func didGetError() {
        navigationService.showErrorAlert { [weak self] in
            self?.viewDidLoad()
        }
    }
    
    func didSelectIndustry() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            self?.didSelectDismissAction()
        }
    }
}
