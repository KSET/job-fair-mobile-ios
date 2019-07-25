import Foundation

class AccountPresenter {
    
    private unowned let viewController: AccountContainerViewController
    
    init(viewController: AccountContainerViewController) {
        self.viewController = viewController
    }
    
    func showLoginViewController() {
        viewController.showLoginViewController()
    }
    
    func showProfileViewController(for user: User) {
        viewController.showProfileViewController(for: user)
    }
}
