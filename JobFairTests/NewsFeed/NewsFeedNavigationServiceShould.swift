import Quick
import Nimble
@testable import JobFair

class NewsFeedNavigationServiceShould: QuickSpec {
    
    let window = UIWindow()
    
    override func spec() {
        let newsViewModel = NewsViewModel(id: "1",
                                          title: "1",
                                          content: NSAttributedString(string: "1"),
                                          thumbnailUrl: URL(string: "http://test.com")!,
                                          imageUrl: URL(string: "http://test.com")!,
                                          publishedAt: "01.01.2001.",
                                          link: URL(string: "http://test.com")!)
        var navigationController: UINavigationController!
        var sut: NewsFeedNavigationService!
        
        beforeEach {
            navigationController = UINavigationController()
            sut = NewsFeedNavigationService(navigationController: navigationController)
            self.window.rootViewController = navigationController
            self.window.makeKeyAndVisible()
        }
        
        afterEach {
            navigationController = nil
            sut = nil
        }
        
        describe("showNewsDetails(with newsItems: [NewsViewModel], selectedIndex: Int)") {
            it("should push news details view controller on stack") {
                sut.navigateToNewsDetails(with: [newsViewModel], selectedIndex: 0)
                let topViewController = navigationController.topViewController
                
                expect(topViewController).to(beAKindOf(JobFairPageViewController.self))
            }
        }
        
        describe("showErrorAlertView(retryCompletions)") {
            it("should show alert view controller of the navigation stack") {
                sut.showErrorAlert()
                
                expect(navigationController.visibleViewController).to(beAKindOf(UIAlertController.self))
            }
        }
    }
}
