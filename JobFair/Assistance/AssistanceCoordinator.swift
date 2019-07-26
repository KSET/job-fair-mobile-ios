import Foundation

class AssistanceCoordinator {
    
    private let presenter: AssistancePresenter
    private let useCase = AssistanceUseCase()
    private let navigationService: BaseNavigationService
    
    init(viewController: AssistanceViewController) {
        navigationService = BaseNavigationService(navigationController: viewController.navigationController)
        presenter = AssistancePresenter(viewController: viewController)
    }
    
    func didTapButtonWith(text: String?) {
        useCase.submitAssitanceRequest(with: text, presenter: presenter)
    }
    
    func showErrorAlert() {
        navigationService.showErrorAlert()
    }
}
