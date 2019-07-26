import UIKit

class CompanyPagerViewController: UIPageViewController {
    
    private let companies: [CompanyViewModel]
    private let companyIndex: Int
    private let buttonHeight: CGFloat = 44
    private let buttonWidth: CGFloat = 44
    
    init(companyIndex: Int, companies: [CompanyViewModel]) {
        self.companies = companies
        self.companyIndex = companyIndex
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        title = Constants.Companies.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        dataSource = self
        let firstCompanyViewController = createCompanyDetailsViewController(for: companies[companyIndex])
        setViewControllers([firstCompanyViewController], direction: .forward, animated: false, completion: nil)
    }
    
    private func createCompanyDetailsViewController(for company: CompanyViewModel) -> CompanyDetailsViewController {
        let viewController = CompanyDetailsViewController(company: company)
        return viewController
    }
    
    private func scrollToViewController(viewController: UIViewController,
                                        direction: UIPageViewControllerNavigationDirection = .forward) {
        setViewControllers([viewController],
                           direction: direction,
                           animated: true)
    }
}

extension CompanyPagerViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let companyDetailsViewController = viewController as? CompanyDetailsViewController else {
            return nil
        }
        
        if let previousItem = companies.before(item: companyDetailsViewController.company) {
            return createCompanyDetailsViewController(for: previousItem)
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let companyDetailsViewController = viewController as? CompanyDetailsViewController else {
            return nil
        }
        
        if let nextItem = companies.after(item: companyDetailsViewController.company) {
            return createCompanyDetailsViewController(for: nextItem)
        }
        
        return nil
    }
}

extension CompanyPagerViewController: Swipeable {
    
    var rightNavigationItem: UIBarButtonItem? {
        return nil
    }

    func showNextPage() {
        guard let currentViewController = viewControllers?.first,
            let nextViewController = pageViewController(self, viewControllerAfter: currentViewController) else {
                return
        }

        setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
    }

    func showPreviousPage() {
        guard let currentViewController = viewControllers?.first,
            let previousViewController = pageViewController(self, viewControllerBefore: currentViewController) else {
                return
        }

        setViewControllers([previousViewController], direction: .reverse, animated: true, completion: nil)
    }

    var hasNext: Bool {
        guard let currentViewController = viewControllers?.first as? CompanyDetailsViewController,
            let companyIndex = companies.index(of: currentViewController.company) else {
                return false
        }

        return companyIndex < companies.count - 1
    }

    var hasPrevious: Bool {
        guard let currentViewController = viewControllers?.first as? CompanyDetailsViewController,
            let companyIndex = companies.index(of: currentViewController.company) else {
                return false
        }

        return companyIndex > 0
    }
}
