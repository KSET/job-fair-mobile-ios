import Foundation

class RootPresenter {
    
    private unowned let viewController: RootViewController
    
    init(viewController: RootViewController) {
        self.viewController = viewController
    }
    
    func showTabBarViewController() {
        viewController.showTabBarViewController()
    }

    func showLoginViewController() {
        viewController.showLoginViewController()
    }
}
