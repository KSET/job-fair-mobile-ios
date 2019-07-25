import UIKit

class BaseNavigationController: UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        setDefaultNavigationBarAppearance()
        addBoothsBarItem()
        addProfileBarItem()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        super.pushViewController(viewController, animated: animated)
    }
    
    private func addBoothsBarItem() {
        let boothBarItem = UIBarButtonItem(title: Constants.Map.title, style: .plain, target: self, action: #selector(didTapBoothsBarButton))
        viewControllers.first?.navigationItem.leftBarButtonItem = boothBarItem
    }
    
    private func addProfileBarItem() {
        let profileImage = UIImage(named: "profile")
        let profileBarItem = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(didTapProfileButton))
        viewControllers.first?.navigationItem.rightBarButtonItem = profileBarItem
    }
    
    @objc
    private func didTapProfileButton() {
        let accountViewController = AccountContainerViewController()
        let navigationController = BaseNavigationController(rootViewController: accountViewController)
        addCloseButton(to: accountViewController)
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc
    private func didTapBoothsBarButton() {
        let boothsViewController = BoothsViewController()
        let navigationController = BaseNavigationController(rootViewController: boothsViewController)
        addCloseButton(to: boothsViewController)
        present(navigationController, animated: true, completion: nil)
    }
    
    private func addCloseButton(to viewController: UIViewController) {
        let closeBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close"), style: .plain, target: self, action: #selector(didTapCloseButton))
        viewController.navigationItem.leftBarButtonItem = closeBarButtonItem
    }
    
    @objc func didTapCloseButton() {
        dismiss(animated: true, completion: nil)
    }
}
