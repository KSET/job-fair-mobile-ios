import UIKit
import RxKeyboard
import RxSwift

class LoginFormViewController: UIViewController {
    
    private var disposeBag = DisposeBag()
    private let logoImageView = UIImageView()
    
    let formView = LoginFormView()
    var coordinator: LoginFormCoordinator!
    weak var delegate: LoginDelegate?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "" // To remove back button title only on reset password screen
        coordinator = LoginFormCoordinator(viewController: self)
        view.backgroundColor = .white
        setupFormView()
        addKeyboardDismissRecognizer()
        addButtonTargets()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addKeyboardListener()
        formView.emailTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dismissKeyboard()
        disposeBag = DisposeBag()
    }
    
    func showNetworkError() {
        dismissKeyboard()
        navigationController?.hideLoadingViewController()
        coordinator.showNetworkError()
    }
    
    func showInputError() {
        navigationController?.hideLoadingViewController()
        formView.showInputError()
    }
    
    private func addKeyboardListener() {
        RxKeyboard.instance.willShowVisibleHeight
            .drive(onNext: { [formView] keyboardVisibleHeight in
                formView.contentOffset.y += keyboardVisibleHeight
            })
            .disposed(by: disposeBag)
    }
    
    @objc
    override func dismissKeyboard() {
        formView.setContentOffset(.zero, animated: true)
        super.dismissKeyboard()
    }
    
    private func setupFormView() {
        setupLogoImageView()
        view.addSubview(formView)
        formView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                formView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                formView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                formView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
                formView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor),
                formView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ]
        )
    }
    
    private func setupLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = UIImage(named: "login_logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        let logoTopOffset: CGFloat = view.frame.height > 600 ? 40 : 0
        NSLayoutConstraint.activate(
            [
                logoImageView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: logoTopOffset),
                logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                logoImageView.widthAnchor.constraint(equalToConstant: 170),
                logoImageView.heightAnchor.constraint(equalToConstant: 84)
            ]
        )
    }
    
    private func addButtonTargets() {
        formView.loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        formView.forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPasswordButton), for: .touchUpInside)
    }
    
    @objc
    private func didTapLoginButton() {
        formView.resetInputFieldError()
        let email = formView.emailTextField.text
        let password = formView.passwordTextField.text
        coordinator.didTapLoginButton(email: email, password: password)
    }
    
    @objc
    private func didTapForgotPasswordButton() {
        coordinator.didTapForgotPasswordButton(for: formView.emailTextField.text)
    }
}
