import UIKit

protocol LoginDelegate: class {
    func didFinishLogin()
}

class LoginViewController: UIViewController {    
    
    private let loginView = LoginView()
    
    weak var delegate: LoginDelegate?
    
    private var coordinator: LoginCoordinator!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "" // To remove back button title only on login form screen
        coordinator = LoginCoordinator(viewController: self)
        setupLoginView()
        addButtonObservers()
        navigationController?.setClearNavigationBar()
    }
    
    private func setupLoginView() {
        view.addSubview(loginView)
        loginView.pinAllEdges(to: view)
    }
    
    private func addButtonObservers() {
        loginView.loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        loginView.skipButton.addTarget(self, action: #selector(didTapSkipButton), for: .touchUpInside)
    }
    
    @objc
    private func didTapSkipButton() {
        delegate?.didFinishLogin()
    }
    
    @objc
    private func didTapLoginButton() {
        coordinator.didTapLoginButton(loginDelegate: delegate)
    }
}
