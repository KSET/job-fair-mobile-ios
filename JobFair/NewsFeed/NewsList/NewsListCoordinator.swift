import Foundation
import UIKit

class NewsListCoordinator {
    unowned private let viewController: NewsListViewController
    private let presenter: NewsListPresenter
    private let newsFeed: NewsFeed
    var navigationService: NewsFeedNavigationService
    
    init(viewController: NewsListViewController,
         newsFeed: NewsFeed = NewsFeed()) {
        self.viewController = viewController
        self.navigationService = NewsFeedNavigationService(navigationController: viewController.navigationController)
        self.newsFeed = newsFeed
        self.presenter = NewsListPresenter(viewController: viewController)
    }
    
    func viewDidLoad() {
        newsFeed.showNewsList(in: presenter)
    }
    
    func didPullToRefresh() {
        viewDidLoad()
    }
    
    func didTapNewsItem(newsItems: [NewsViewModel], selectedIndex: Int) {
        navigationService.navigateToNewsDetails(with: newsItems, selectedIndex: selectedIndex)
    }
    
    func didGetError() {
        navigationService.showErrorAlert { [weak self] in
            self?.viewDidLoad()
        }
    }
}
