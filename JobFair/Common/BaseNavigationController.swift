import UIKit

class BaseNavigationController: UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        setDefaultNavigationBarAppearance()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        setNavigationBarInfoButton(to: viewController)
        super.pushViewController(viewController, animated: animated)
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        setNavigationBarInfoButton(to: viewControllerToPresent)
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    func setNavigationBarInfoButton(to viewController: UIViewController) {
        let infoButton = UIButton(type: .infoDark)
        infoButton.addTarget(self, action: #selector(presentInfoViewController), for: .touchUpInside)
        let infoBarButton = UIBarButtonItem(customView: infoButton)
        infoBarButton.tintColor = .gray
        viewController.navigationItem.rightBarButtonItem = infoBarButton
    }
    
    @objc func presentInfoViewController() {
        let infoViewController = InfoViewController()
        let infoNavigationController = UINavigationController(rootViewController: infoViewController)
        super.present(infoNavigationController, animated: true, completion: nil)
    }
}
