import Foundation
import UIKit
@testable import JobFair

class NewsFeedMock: NewsFeed {
    var didShowNewsList = false
    
    override func showNewsList(in presenter: NewsListPresenter) {
        didShowNewsList = true
    }
}
