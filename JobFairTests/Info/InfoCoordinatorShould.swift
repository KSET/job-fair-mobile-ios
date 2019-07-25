import Quick
import Nimble
@testable import JobFair

class InfoCoordinatorShould: QuickSpec {
    
    override func spec() {
        var sut: InfoCoordinator!
        var navigationService: InfoNavigationServiceMock!
        var presenter: InfoPresenterMock!
        var viewController: InfoViewController!
        
        beforeEach {
            viewController = InfoViewController()
            sut = InfoCoordinator(viewController: viewController)
            let navigationController = UINavigationController()
            navigationService = InfoNavigationServiceMock(navigationController: navigationController)
            presenter = InfoPresenterMock(viewController: viewController)
            sut.presenter = presenter
            sut.navigationService = navigationService
        }
        
        afterEach {
            sut = nil
            navigationService = nil
            presenter = nil
            viewController = nil
        }
        
        describe("viewDidLoad()") {
            it("should tell presenter to show info") {
                sut.viewDidLoad()
                expect(presenter.didShowInfo) == true
            }
        }
        
        describe("didSelectOpenURLAction(_ url: URL)") {
            it("should tell navigationService to open URL") {
                let url = URL(string: "https://undabot.com/")!
                sut.didSelectOpenURLAction(url)
                expect(navigationService.didOpenURL) == true
            }
        }
        
        describe("didSelectShareAction()") {
            it("should tell navigationService to share website") {
                sut.didSelectShareAction()
                expect(navigationService.didShareWebsite) == true
            }
        }
        
        describe("didSelectUndabotWebsiteAction()") {
            it("should tell navigationService to navigate to Undabot website") {
                sut.didSelectUndabotWebsiteAction()
                expect(navigationService.didOpenURL) == true
            }
        }
        
        describe("didSelectDayOneStreamAction()") {
            it("should tell navigationService to open Google Maps") {
                sut.didSelectDayOneStreamAction()
                expect(navigationService.didOpenDayOneStream) == true
            }
        }
        
        describe("didSelectDayTwoStreamAction()") {
            it("should tell navigationService to open stream URL") {
                sut.didSelectDayTwoStreamAction()
                expect(navigationService.didOpenDayTwoStream) == true
            }
        }
    }
}
