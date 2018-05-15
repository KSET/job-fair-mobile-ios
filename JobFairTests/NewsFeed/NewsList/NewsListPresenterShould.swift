import Quick
import Nimble
@testable import JobFair

class NewsListPresenterShould: QuickSpec {
    
    override func spec() {
        var viewController: NewsListViewControllerMock!
        
        var sut: NewsListPresenter!
        
        beforeEach {
            viewController = NewsListViewControllerMock()
            sut = NewsListPresenter(viewController: viewController)
        }
        
        afterEach {
            viewController = nil
            sut = nil
        }
        
        describe("show(newsList)") {
            
            it("should set news data in viewcontroller") {
                let news = News(id: "1",
                                title: "News Title",
                                content: "News content",
                                thumbnailUrl: "www.test.com",
                                imageUrl: "www.test.com",
                                publishedAt: Date(),
                                user: nil,
                                link: "www.test.com")
                let newsList = [news]
                
                sut.show(newsList: newsList)
                
                expect(viewController.newsList).to(haveCount(1))
                
                let presentedNews = viewController.newsList?.first
                expect(presentedNews?.id).to(match(news.id))
                expect(presentedNews?.title).to(match(news.title))
                expect(presentedNews?.content.string).to(match(news.content))
                expect(presentedNews?.thumbnailUrl?.path).to(match(news.thumbnailUrl))
                expect(presentedNews?.imageUrl?.path).to(match(news.imageUrl))

                let publishedAt = SharedDateFormatter.shared.string(from: news.publishedAt)
                
                expect(presentedNews?.publishedAt).to(equal(publishedAt))
                expect(presentedNews?.link.path).to(match(news.link))
            }
        }
        
        describe("showError()") {
            
            it("should tell viewcontroller to show error") {
                sut.showError()
                
                expect(viewController.didShowError).to(beTrue())
            }
        }
    }
}

private class NewsListViewControllerMock: NewsListViewController {
    var newsList: [NewsViewModel]?
    var didShowError = false
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func show(news: [NewsViewModel]) {
        self.newsList = news
    }
    
    override func showError() {
        didShowError = true
    }
}
