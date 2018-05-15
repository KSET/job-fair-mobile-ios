import Foundation
@testable import JobFair

class NewsFeedNavigationServiceMock: NewsFeedNavigationService {
    var didShowNewsDetails = false
    var didShowShareModel = false
    var didShowError = false
    var newsToShare: NewsViewModel?
    var selectedIndex: Int?
    
    init() {
        super.init(navigationController: nil)
    }
    
    override func navigateToNewsDetails(with newsItems: [NewsViewModel], selectedIndex: Int) {
        didShowNewsDetails = true
        self.selectedIndex = selectedIndex
    }
    
    override func presentShareModal(with newsItem: NewsViewModel) {
        didShowShareModel = true
        newsToShare = newsItem
    }
    
    override func showErrorAlert(retryCompletion: (() -> Void)?) {
        didShowError = true
    }
}
