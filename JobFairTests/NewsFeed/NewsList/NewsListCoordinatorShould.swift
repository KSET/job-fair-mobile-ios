import Quick
import Nimble
@testable import JobFair

class NewsListCoordinatorShould: QuickSpec {
    
    override func spec() {
        var newsFeedMock: NewsFeedMock!
        var viewController: NewsListViewController!
        var navigationService: NewsFeedNavigationServiceMock!
        var sut: NewsListCoordinator!
        
        beforeEach {
            newsFeedMock = NewsFeedMock()
            viewController = NewsListViewController()
            navigationService = NewsFeedNavigationServiceMock()
            sut = NewsListCoordinator(viewController: viewController,
                                      newsFeed: newsFeedMock)
            sut.navigationService = navigationService
        }
        
        afterEach {
            newsFeedMock = nil
            viewController = nil
            navigationService = nil
            sut = nil
        }
        
        describe("viewDidLoad()") {
            
            it("should tell news feed to show news list") {
                sut.viewDidLoad()
                
                expect(newsFeedMock.didShowNewsList).to(beTrue())
            }
        }
        
        describe("didPullToRefresh()") {
            
            it("should tell news feed to show initial news list") {
                sut.didPullToRefresh()
                
                expect(newsFeedMock.didShowNewsList).to(beTrue())
            }
        }
        
        describe("didTap(newsItem)") {
            
            it("should tell navigation service to push news details view controller on stack") {
                let newsItem = NewsViewModel(id: "1",
                                             title: "title",
                                             content: NSAttributedString(string: "1"),
                                             thumbnailUrl: nil,
                                             imageUrl: nil,
                                             publishedAt: "01.12.2017.",
                                             link: URL(string: "www.test.com")!)
                
                sut.didTapNewsItem(newsItems: [newsItem], selectedIndex: 0)
                
                expect(navigationService.didShowNewsDetails).to(beTrue())
                expect(navigationService.selectedIndex).to(equal(0))
            }
        }
        
        describe("didGetError()") {
            
            it("should tell navigation service to present error view controller") {
                sut.didGetError()
                
                expect(navigationService.didShowError).to(beTrue())
            }
        }
    }
}
