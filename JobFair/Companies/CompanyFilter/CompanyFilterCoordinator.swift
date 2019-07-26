import UIKit

class CompanyFilterCoordinator {
    var presenter: CompanyFilterPresenter
    var useCase: CompanyFilterUseCase
    
    init(viewController: CompanyFilterViewController,
         useCase: CompanyFilterUseCase = CompanyFilterUseCase()) {
        self.presenter = CompanyFilterPresenter(viewController: viewController)
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        useCase.fetchIndustries(presenter: presenter)
    }

    func didGetError() {
        presenter.showError()
    }
}
