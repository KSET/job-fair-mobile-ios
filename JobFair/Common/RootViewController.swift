import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let newsViewController = BaseNavigationController(rootViewController: NewsListViewController())
        newsViewController.tabBarItem = UITabBarItem(title: Constants.News.title, image: #imageLiteral(resourceName: "news"), selectedImage: #imageLiteral(resourceName: "news_active"))

        let presentationsViewController = BaseNavigationController(rootViewController: EventsViewController(eventType: .presentations))
        presentationsViewController.tabBarItem = UITabBarItem(title: EventType.presentations.title, image: #imageLiteral(resourceName: "presentations"), selectedImage: #imageLiteral(resourceName: "presentations_active"))

        let workshopsViewController = BaseNavigationController(rootViewController: EventsViewController(eventType: .workshops))
        workshopsViewController.tabBarItem = UITabBarItem(title: EventType.workshops.title, image: #imageLiteral(resourceName: "workshop"), selectedImage: #imageLiteral(resourceName: "workshop_active"))

        let companiesViewController = BaseNavigationController(rootViewController: CompanyListViewController())
        companiesViewController.tabBarItem = UITabBarItem(title: Constants.Companies.title, image: #imageLiteral(resourceName: "company"), selectedImage: #imageLiteral(resourceName: "company_active"))

        let mapViewController = BaseNavigationController(rootViewController: MapViewController())
        mapViewController.tabBarItem = UITabBarItem(title: Constants.Map.title, image: #imageLiteral(resourceName: "map"), selectedImage: #imageLiteral(resourceName: "map_active"))

        setViewControllers(
            [
                newsViewController,
                presentationsViewController,
                workshopsViewController,
                companiesViewController,
                mapViewController
            ],
            animated: false)
    }
}
