import Quick
import Nimble
import XLPagerTabStrip
@testable import JobFair

class EventPresenterShould: QuickSpec {

    override func spec() {
        var sut: EventPresenter!
        var viewController: EventsViewControllerMock!

        beforeEach {
            viewController = EventsViewControllerMock()
            sut = EventPresenter(viewController: viewController)
        }

        afterEach {
            viewController = nil
            sut = nil
        }

        describe("showError()") {
            it("should tell view controller to show error") {
                sut.showError()

                expect(viewController.didShowError) == true
            }
        }

        describe("show(events)") {
            it("should tell view controller to show events") {
                let events = SortedEvents(firstDayEvents: [], secondDayEvents: [], highlightedEvent: nil)
                sut.show(events: events)

                expect(viewController.didShowEvents) == true
                expect(viewController.didShowError) == false
            }
        }
    }
}
