import Foundation

class LoginFormCoordinator {
    
    private let navigationService: LoginNavigationService
    private let presenter: LoginFormPresenter
    private let useCase = CredentialsUseCase()
    
    init(viewController: LoginFormViewController) {
        presenter = LoginFormPresenter(viewController: viewController)
        navigationService = LoginNavigationService(navigationController: viewController.navigationController)
    }
    
    func didTapLoginButton(email: String?, password: String?) {
        useCase.login(email: email, password: password, presenter: presenter)
    }
    
    func didTapResetPasswordButton(email: String?) {
        useCase.resetPassword(for: email, presenter: presenter)
    }
    
    func didTapForgotPasswordButton(for email: String?) {
        navigationService.showResetPasswordViewController(for: email)
    }
    
    func showNetworkError() {
        navigationService.showErrorAlert()
    }
}
