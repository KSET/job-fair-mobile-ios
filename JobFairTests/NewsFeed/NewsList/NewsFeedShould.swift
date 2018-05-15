import Quick
import Nimble
@testable import JobFair

class NewsFeedShould: QuickSpec {
    
    override func spec() {
        Nimble.AsyncDefaults.Timeout = 3
        Nimble.AsyncDefaults.PollInterval = 0.1
        
        var newsListPresenterMock: NewsListPresenterMock!
        var rssReaderMock: RSSReaderMock!
        var sut: NewsFeed!
        
        beforeEach {
            newsListPresenterMock = NewsListPresenterMock(viewController: NewsListViewController())
            rssReaderMock = RSSReaderMock()
            sut = NewsFeed()
            sut.rssReader = rssReaderMock
        }
        
        afterEach {
            newsListPresenterMock = nil
            rssReaderMock = nil
            sut = nil
        }
        
        describe("showNewsList()") {
            
            context("and error occured while fetching news") {
                it("should tell presenter to show error") {
                    rssReaderMock.shouldReturnError = true
                    
                    sut.showNewsList(in: newsListPresenterMock)
                    
                    expect(newsListPresenterMock.didShowError).toEventually(beTrue())
                }
            }
            
            it("should tell presenter to show news list") {
                sut.showNewsList(in: newsListPresenterMock)
                
                expect(newsListPresenterMock.didShowNewsList).toEventually(beTrue())
            }
        }
    }
}
