import UIKit

class TabBarViewController: UITabBarController {
    
    private lazy var menuView = TabBarMenuView()
    private var coordinator: TabBarCoordinator!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        coordinator = TabBarCoordinator(tabBarViewController: self)
        setInitialViewControllers()
        addMenuView()
        setMenuClickCompletion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        menuView.setMenuItems()
    }
    
    private func setInitialViewControllers() {
        let newsViewController = BaseNavigationController(rootViewController: NewsListViewController())
        newsViewController.tabBarItem = UITabBarItem(title: Constants.News.title, image: #imageLiteral(resourceName: "news.pdf"), tag: 1)
        
        let agendaViewController = BaseNavigationController(rootViewController: AgendaViewController())
        agendaViewController.tabBarItem = UITabBarItem(title: Constants.Events.agenda, image: #imageLiteral(resourceName: "agenda.pdf"), tag: 0)
        
        let companiesViewController = BaseNavigationController(rootViewController: CompanyListViewController())
        companiesViewController.tabBarItem = UITabBarItem(title: Constants.Companies.title, image: UIImage(named: "company"), tag: 2)
        
        let infoViewController = BaseNavigationController(rootViewController: InfoViewController())
        infoViewController.tabBarItem = UITabBarItem(title: Constants.Social.title, image: #imageLiteral(resourceName: "about.pdf"), tag: 3)
        
        setViewControllers(
            [
                agendaViewController,
                newsViewController,
                UIViewController(),
                companiesViewController,
                infoViewController
            ],
            animated: false)
    }
    
    private func setMenuClickCompletion() {
        menuView.fanMenuView.onItemWillClick = { [weak self] button in
            var rotationAngle: CGFloat = 0
            let fanMenuView = self?.menuView.fanMenuView
            
            self?.coordinator.didTapFabButton(buttonId: button.id)
            
            if fanMenuView?.isOpen == true {
                self?.removeOverlayView()
            }
            
            if button.id == Constants.Menu.ButtonId.main && fanMenuView?.isOpen == false {
                rotationAngle = .pi / 4
                self?.addOverlayView()
            }
            
            UIView.animate(withDuration: 0.35) {
                self?.menuView.mainButtonView.transform = CGAffineTransform(rotationAngle: rotationAngle)
            }
        }
    }
    
    private func addMenuView() {
        menuView.removeFromSuperview()
        menuView = TabBarMenuView()
        view.addSubview(menuView)
        menuView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                menuView.widthAnchor.constraint(equalToConstant: 300),
                menuView.heightAnchor.constraint(equalToConstant: 300),
                menuView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                menuView.centerYAnchor.constraint(equalTo: tabBar.topAnchor, constant: 10)
            ]
        )
    }
    
    private func addOverlayView() {
        let overlay = TabBarMenuOverlay(frame: view.frame)
        view.insertSubview(overlay, belowSubview: menuView)
        overlay.backgroundColor = UIColor.brandColor.withAlphaComponent(0.8)

        UIView.animate(withDuration: 0.3) {
            overlay.alpha = 1
        }
    }
    
    private func removeOverlayView() {
        let tabBarOverlayViews = view.subviews.filter { $0 is TabBarMenuOverlay }
        UIView.animate(withDuration: 0.3, animations: {
            tabBarOverlayViews.forEach { $0.alpha = 0 }
        }, completion: { _ in
            tabBarOverlayViews.forEach { $0.removeFromSuperview() }
        })
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is UINavigationController {
            return true
        }
        
        return false
    }
}
