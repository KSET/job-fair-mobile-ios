import UIKit

class LoginCoordinator {
    
    private let navigationService: LoginNavigationService
    
    init(viewController: LoginViewController) {
        self.navigationService = LoginNavigationService(navigationController: viewController.navigationController)
    }
    
    func didTapLoginButton(loginDelegate: LoginDelegate?) {
        navigationService.showLoginFormViewController(with: loginDelegate)
    }
}
