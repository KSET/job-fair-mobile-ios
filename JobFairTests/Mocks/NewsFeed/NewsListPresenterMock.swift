import Foundation
@testable import JobFair

class NewsListPresenterMock: NewsListPresenter {
    var didShowNewsList = false
    var didShowError = false
    
    required override init(viewController: NewsListViewController) {
        super.init(viewController: viewController)
    }
    
    override func show(newsList: [News]) {
        didShowNewsList = true
    }
    
    override func showError() {
        didShowError = true
    }
}
