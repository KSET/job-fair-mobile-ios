import UIKit
import SkyFloatingLabelTextField

class LoginFormView: UIScrollView {
    
    let loginButton = UIButton.primaryButton
    let forgotPasswordButton = UIButton(frame: .init(x: 0, y: 0, width: 80, height: 48))
    let emailTextField = LoginTextField()
    let passwordTextField = LoginTextField()
    
    private let contentView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resetInputFieldError() {
        emailTextField.errorMessage = nil
        passwordTextField.errorMessage = nil
    }

    func showInputError() {
        emailTextField.errorMessage = emailTextField.title
        passwordTextField.errorMessage = passwordTextField.title
    }
    
    private func commonInit() {
        setupContentView()
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
        setupForgotPasswordButton()
    }
    
    private func setupContentView() {
        addSubview(contentView)
        contentView.pinAllEdges(to: self)
        contentView.matchWidth(of: self)
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: heightAnchor)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true
    }
    
    private func setupEmailTextField() {
        contentView.addSubview(emailTextField)
        emailTextField.keyboardType = .emailAddress
        emailTextField.placeholder = Constants.Login.emailPlaceholder
        emailTextField.title = Constants.Login.emailPlaceholder
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                emailTextField.heightAnchor.constraint(equalToConstant: 48),
                emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            ]
        )
    }
    
    private func setupPasswordTextField() {
        contentView.addSubview(passwordTextField)
        passwordTextField.placeholder = Constants.Login.passwordPlaceholder
        passwordTextField.title = Constants.Login.passwordPlaceholder
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
                passwordTextField.heightAnchor.constraint(equalToConstant: 48),
                passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            ]
        )
    }
    
    private func setupLoginButton() {
        contentView.addSubview(loginButton)
        loginButton.setTitle(Constants.Login.loginButtonTitle, for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32),
                loginButton.heightAnchor.constraint(equalToConstant: 48),
                loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
                loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            ]
        )
    }
    
    private func setupForgotPasswordButton() {
        forgotPasswordButton.setTitle(Constants.Login.forgotButtonTitle, for: .normal)
        forgotPasswordButton.setTitleColor(.black, for: .normal)
        forgotPasswordButton.titleLabel?.font = .titleRegular
        passwordTextField.rightView = forgotPasswordButton
        passwordTextField.rightViewMode = .unlessEditing
    }
}
