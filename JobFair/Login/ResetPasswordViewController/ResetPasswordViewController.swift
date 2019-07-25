import UIKit

class ResetPasswordViewController: LoginFormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        formView.loginButton.setTitle("Reset my password", for: .normal)
        formView.passwordTextField.isHidden = true
        formView.loginButton.removeTarget(nil, action: nil, for: .allEvents)
        formView.loginButton.addTarget(self, action: #selector(didTapResetPassword), for: .touchUpInside)
    }
    
    @objc
    private func didTapResetPassword() {
        coordinator.didTapResetPasswordButton(email: formView.emailTextField.text)
    }
}
