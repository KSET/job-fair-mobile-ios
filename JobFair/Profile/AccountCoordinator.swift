import Foundation

class AccountCoordinator {    
    
    private let presenter: AccountPresenter
    
    init(viewController: AccountContainerViewController) {
        presenter = AccountPresenter(viewController: viewController)
    }
    
    func viewDidLoad() {
        guard let user = SessionManager.instance.user else {
            presenter.showLoginViewController()
            return
        }
        
        presenter.showProfileViewController(for: user)
    }
    
    func didTapLogoutButton() {
        SessionManager.instance.deleteCredentials()
    }
}
