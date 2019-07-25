import UIKit

class AccountContainerViewController: UIViewController {
    
    private var coordinator: AccountCoordinator!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = Constants.StudentProfile.title
        coordinator = AccountCoordinator(viewController: self)
        coordinator.viewDidLoad()
        navigationItem.rightBarButtonItem = nil
    }
    
    func showLoginViewController() {
        let loginFromViewController = LoginFormViewController()
        loginFromViewController.delegate = self
        show(loginFromViewController)
    }
    
    func showProfileViewController(for user: User) {
        let profileViewController = ProfileViewController(user: user)
        profileViewController.delegate = self
        show(profileViewController)
    }
}

extension AccountContainerViewController: LoginDelegate {
    
    func didFinishLogin() {
        dismiss(animated: true, completion: nil)
    }
}

extension AccountContainerViewController: ProfileDelegate {
    
    func didTapLogoutButton() {
        coordinator.didTapLogoutButton()
        dismiss(animated: true, completion: nil)
    }
}
