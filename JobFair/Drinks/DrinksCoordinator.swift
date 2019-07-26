import Foundation

class DrinksCoordinator {
    
    private let presenter: DrinksPresenter
    private let useCase = DrinksUseCase()
    private let navigationService: BaseNavigationService
    
    init(viewController: DrinksViewController) {
        navigationService = BaseNavigationService(navigationController: viewController.navigationController)
        presenter = DrinksPresenter(viewController: viewController)
    }
    
    func viewDidLoad() {
        presenter.showDrinks()
    }
    
    func didTapOrderButton(with amountMap: [String: Int]) {
        useCase.submitDrinkRequest(with: amountMap, presenter: presenter)
    }
    
    func showErrorAlert() {
        navigationService.showErrorAlert()
    }
}
