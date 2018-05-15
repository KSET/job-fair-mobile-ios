import Quick
import Nimble
import SafariServices
@testable import JobFair

class InfoNavigationServiceShould: QuickSpec {
    let window = UIWindow()
    
    override func spec() {
        AsyncDefaults.Timeout = 5
        AsyncDefaults.PollInterval = 0.1

        var sut: InfoNavigationService!
        var navigationController: UINavigationController!
        
        beforeEach {
            navigationController = UINavigationController()
            self.window.rootViewController = navigationController
            self.window.makeKeyAndVisible()
            sut = InfoNavigationService(navigationController: navigationController)
        }
        
        afterEach {
            navigationController = nil
            sut = nil
        }
        
        describe("open(_ url: URL)") {
            it("should open URL") {
                let url = URL(string: "https://undabot.com/")!
                sut.open(url)

                expect(navigationController.visibleViewController).toEventually(beAKindOf(SFSafariViewController.self))
            }
        }
        
        describe("dismiss()") {
            it("should open URL") {
                sut.dismiss()
                expect(navigationController.presentedViewController).toEventually(beNil())
            }
        }
        
        describe("openUndabotWebsite()") {
            it("should open URL") {
                sut.openUndabotWebsite()

                expect(navigationController.visibleViewController).toEventually(beAKindOf(SFSafariViewController.self))
            }
        }
        
        describe("openDayOneStream()") {
            it("should open URL") {
                sut.openDayOneStream()

                expect(navigationController.visibleViewController).toEventually(beAKindOf(SFSafariViewController.self))
            }
        }
        
        describe("openDayTwoStream()") {
            it("should open URL") {
                sut.openDayTwoStream()

                expect(navigationController.visibleViewController).toEventually(beAKindOf(SFSafariViewController.self))
            }
        }
        
        describe("openGoogleMaps()") {
            it("should open Google Maps") {
                sut.openGoogleMaps()

                expect(navigationController.visibleViewController).to(beAKindOf(SFSafariViewController.self))
            }
        }
    }
}
