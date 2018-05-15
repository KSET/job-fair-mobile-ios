import Quick
import Nimble
import UIKit
@testable import JobFair

class NewsDetailsCoordinatorShould: QuickSpec {
    
    override func spec() {
        let newsViewModel = NewsViewModel(id: "1",
                                          title: "1",
                                          content: NSAttributedString(string: "1"),
                                          thumbnailUrl: URL(string: "http://test.com")!,
                                          imageUrl: URL(string: "http://test.com")!,
                                          publishedAt: "01.01.2001.",
                                          link: URL(string: "http://test.com")!)
        var navigationService: NewsFeedNavigationServiceMock!
        var viewController: NewsDetailPagerViewController!
        var sut: NewsDetailsCoordinator!

        beforeEach {
            viewController = NewsDetailPagerViewController(news: [newsViewModel], selectedIndex: 0)
            navigationService = NewsFeedNavigationServiceMock()
            sut = NewsDetailsCoordinator(viewController: viewController)
            sut.navigationService = navigationService
        }

        afterEach {
            navigationService = nil
            viewController = nil
            sut = nil
        }
        
        describe("didTapShareButton(with news)") {
            
            it("should open activity view controller with news link") {
                sut.didTapShareButton(with: newsViewModel)
                
                expect(navigationService.didShowShareModel).to(beTrue())
            }
        }
    }
}
