import UIKit

class RootViewController: UIViewController {
    
    private var coordinator: RootCoordinator!
    
    private let backgroundOverlayImageView = UIImageView()
    private let logoImageView = UIImageView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var childViewControllerForStatusBarStyle: UIViewController? {
        guard let navigationController = childViewControllers.last as? UINavigationController else {
            return childViewControllers.first
        }

        return navigationController.visibleViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundOverlay()
        setupLogoImage()
        coordinator = RootCoordinator(viewController: self)
        coordinator.showInitalScreen()
    }
    
    func showLoginViewController() {
        let loginViewController = LoginViewController()
        loginViewController.delegate = self
        let navigationController = UINavigationController(rootViewController: loginViewController)
        show(navigationController)
    }
    
    func showTabBarViewController() {
        show(TabBarViewController())
        setNeedsStatusBarAppearanceUpdate()
    }
    
    private func setupBackgroundOverlay() {
        view.addSubview(backgroundOverlayImageView)
        backgroundOverlayImageView.image = UIImage(named: "background_overlay")
        backgroundOverlayImageView.alpha = 0.3
        backgroundOverlayImageView.contentMode = .scaleAspectFill
        backgroundOverlayImageView.pinAllEdges(to: view)
    }
    
    private func setupLogoImage() {
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = UIImage(named: "launch_image")
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -32),
                logoImageView.widthAnchor.constraint(equalToConstant: 240),
                logoImageView.heightAnchor.constraint(equalToConstant: 120)
            ]
        )
    }
}

extension RootViewController: LoginDelegate {
    
    func didFinishLogin() {
        showTabBarViewController()
    }
}
