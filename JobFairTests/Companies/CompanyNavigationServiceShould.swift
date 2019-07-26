import Quick
import Nimble
import SafariServices
@testable import JobFair

class CompanyNavigationServiceShould: QuickSpec {
    let window = UIWindow()
    
    override func spec() {
        var sut: CompanyNavigationService!
        var navigationController: UINavigationController!
        
        beforeEach {
            navigationController = UINavigationController()
            self.window.rootViewController = navigationController
            self.window.makeKeyAndVisible()
            sut = CompanyNavigationService(navigationController: navigationController)
        }
        
        afterEach {
            navigationController = nil
            sut = nil
        }
        
        describe("dismiss(animated: Bool, completion: (() -> Void)?)") {
            it("should dismiss CompanyFilterViewController") {
                sut.dismiss()
                expect(navigationController.presentedViewController).toEventually(beNil())
            }
        }

        describe("showCompanyDetailViewController(for company:)") {
            it("should show company details view controller on the top of the navigation stack") {
                sut.showCompanyDetailsViewController(for: CompanyViewModel.testInstance)
                expect(navigationController.visibleViewController).to(beAKindOf(CompanyDetailsViewController.self))
            }
        }

        describe("showErrorAlertView(retryCompletions)") {
            it("should show alert view controller on the top of the navigation stack") {
                sut.showErrorAlert()
                expect(navigationController.visibleViewController).to(beAKindOf(UIAlertController.self))
            }
        }

        describe("navigateToCompanyDetails(at:, companies)") {
            it("should show event pager on the top of the navigation stack") {
                sut.navigateToCompanyDetails(at: 0, companies: [CompanyViewModel.testInstance])

                expect(navigationController.visibleViewController).to(beAKindOf(JobFairPageViewController.self))
            }
        }
    }
}
