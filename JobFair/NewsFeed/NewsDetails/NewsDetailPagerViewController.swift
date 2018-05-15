import UIKit

class NewsDetailPagerViewController: UIPageViewController {
    private var coordinator: NewsDetailsCoordinator!
    private let news: [NewsViewModel]
    private let selectedIndex: Int
    
    init(news: [NewsViewModel], selectedIndex: Int) {
        self.selectedIndex = selectedIndex
        self.news = news
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = NewsDetailsCoordinator(viewController: self)
        
        self.dataSource = self
        view.backgroundColor = .white
        setNavigationBarShareButton()
        setPages()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setDefaultNavigationBarAppearance()
    }
    
    private func setPages() {
        let initialNewsDetailsViewController = NewsDetailsViewController(news: news[selectedIndex])
        setViewControllers([initialNewsDetailsViewController], direction: .forward, animated: true, completion: nil)
    }
    
    private func setNavigationBarShareButton() {
        let shareBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "share"), style: .plain, target: self, action: #selector(shareButtonClicked))
        parent?.navigationItem.rightBarButtonItem = shareBarButton
    }
    
    @objc private func shareButtonClicked() {
        guard let currentViewController = viewControllers?.first as? NewsDetailsViewController else {
            return
        }
        
        coordinator.didTapShareButton(with: currentViewController.news)
    }
}

extension NewsDetailPagerViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let newsDetailsViewController = viewController as? NewsDetailsViewController else {
            return nil
        }
        
        if let previousItem = news.before(item: newsDetailsViewController.news) {
            return NewsDetailsViewController(news: previousItem)
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let newsDetailsViewController = viewController as? NewsDetailsViewController else {
            return nil
        }
        
        if let previousItem = news.after(item: newsDetailsViewController.news) {
            return NewsDetailsViewController(news: previousItem)
        }
        
        return nil
    }
}

extension NewsDetailPagerViewController: Swipeable {

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
        guard let currentViewController = viewControllers?.first as? NewsDetailsViewController,
            let newsIndex = news.index(of: currentViewController.news) else {
                return false
        }

        return newsIndex < news.count - 1
    }

    var hasPrevious: Bool {
        guard let currentViewController = viewControllers?.first as? NewsDetailsViewController,
            let newsIndex = news.index(of: currentViewController.news) else {
                return false
        }

        return newsIndex > 0
    }
}
