import UIKit

class LoginNavigationService: BaseNavigationService {
    
    func showLoginFormViewController(with delegate: LoginDelegate?) {
        let loginFormViewController = LoginFormViewController()
        loginFormViewController.delegate = delegate
        navigationController?.pushViewController(loginFormViewController, animated: true)
    }
    
    func showResetPasswordViewController(for email: String?) {
        let resetPasswordViewController = ResetPasswordViewController()
        resetPasswordViewController.formView.emailTextField.text = email
        navigationController?.pushViewController(resetPasswordViewController, animated: true)
    }
}
