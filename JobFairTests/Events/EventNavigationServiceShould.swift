import Quick
import Nimble
import EventKitUI
@testable import JobFair

class EventNavigationServiceShould: QuickSpec {

    let window = UIWindow()

    override func spec() {
        var sut: EventNavigationService!
        var navigationController: UINavigationController!

        beforeEach {
            navigationController = UINavigationController()
            sut = EventNavigationService(navigationController: navigationController)
            self.window.rootViewController = navigationController
            self.window.makeKeyAndVisible()
        }

        afterEach {
            navigationController = nil
            sut = nil
        }

        describe("showEditEventViewController(for event)") {
            it("should show edit event view controller on the top of the navigation stack") {
                sut.presentEditEventViewController(for: CalendarEvent.testInstance)

                expect(navigationController.presentedViewController).to(beAKindOf(EKEventEditViewController.self))
            }
        }

        describe("showEventPager(at index, for event)") {
            it("should show event pager on the top of the navigation stack") {
                sut.showEventPager(at: 0, for: [EventViewModel.testInstance], delegate: nil)

                expect(navigationController.visibleViewController).to(beAKindOf(JobFairPageViewController.self))
            }
        }

        describe("showErrorAlertView(retryCompletions)") {
            it("should show alert view controller on the navigation stack") {
                sut.showErrorAlert()

                expect(navigationController.visibleViewController).to(beAKindOf(UIAlertController.self))
            }
        }

        describe("showCompanyDetailsViewController(for company:)") {
            it("should show company details view controller on the navigation stack") {
                sut.showCompanyDetailsViewController(for: CompanyViewModel.testInstance)

                expect(navigationController.visibleViewController).to(beAKindOf(CompanyDetailsViewController.self))
            }
        }

        describe("showNoCalendarPermissionAlert") {
            it("should show alert view controller on the navigation stack") {
                sut.showNoCalendarPermissionAlert()

                expect(navigationController.visibleViewController).to(beAKindOf(UIAlertController.self))
            }
        }
    }
}
