import Foundation

class RootCoordinator {
    
    private let presenter: RootPresenter
    private let useCase = RootUseCase()
    
    init(viewController: RootViewController) {
        presenter = RootPresenter(viewController: viewController)
    }
    
    func showInitalScreen() {
        useCase.fetchCurrentUser(presenter: presenter)
    }
}
