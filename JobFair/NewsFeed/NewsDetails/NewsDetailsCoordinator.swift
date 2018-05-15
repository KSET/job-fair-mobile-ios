import Foundation
import UIKit

class NewsDetailsCoordinator {
    unowned private let viewController: NewsDetailPagerViewController
    var navigationService: NewsFeedNavigationService
    
    init(viewController: NewsDetailPagerViewController) {
        self.viewController = viewController
        navigationService = NewsFeedNavigationService(navigationController: viewController.navigationController)
    }
    
    func didTapShareButton(with news: NewsViewModel) {
        navigationService.presentShareModal(with: news)
    }
}
