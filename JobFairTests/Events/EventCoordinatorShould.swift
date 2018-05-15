import Quick
import Nimble
import EventKit
@testable import JobFair

class EventCoordinatorShould: QuickSpec {

    override func spec() {
        var sut: EventCoordinator!
        var eventStore: EventStoreMock!
        var eventCreator: EventCreatorMock!
        var navigationService: EventNavigationServiceMock!

        beforeEach {
            navigationService = EventNavigationServiceMock(navigationController: nil)
            eventCreator = EventCreatorMock()
            eventStore = EventStoreMock()
            sut = EventCoordinator(viewController: EventsViewController(eventType: .workshops))
            sut.eventStore = eventStore
            sut.eventCreator = eventCreator
            sut.navigationService = navigationService
        }

        afterEach {
            navigationService = nil
            eventCreator = nil
            eventStore = nil
            sut = nil
        }

        describe("viewDidLoad(eventType)") {
            context("event type is presentation") {
                it("should tell event store to show presentations") {
                    sut.viewDidLoad(eventType: .presentations)

                    expect(eventStore.didShowPresentations) == true
                }
            }

            context("event type is workshop") {
                it("should tell event store to show workshops") {
                    sut.viewDidLoad(eventType: .workshops)

                    expect(eventStore.didShowWorkshops) == true
                }
            }
        }

        describe("didPullToRefresh(eventType)") {
            context("event type is presentation") {
                it("should tell event store to show presentations") {
                    sut.didPullToRefresh(eventType: .presentations)

                    expect(eventStore.didShowPresentations) == true
                }
            }

            context("event type is workshop") {
                it("should tell event store to show workshops") {
                    sut.didPullToRefresh(eventType: .workshops)

                    expect(eventStore.didShowWorkshops) == true
                }
            }
        }

        describe("didTapCalendarButton") {
            it("should tell event store creator to create event") {
                let testEvent = EventViewModel.testInstance
                sut.didTapCalendarButton(for: testEvent)

                expect(eventCreator.didCreateEvent) == true
            }

            context("event creator successfully created event") {
                it("should tell navigation service to show event edit view controller") {
                    let testEvent = EventViewModel.testInstance
                    sut.didTapCalendarButton(for: testEvent)

                    expect(navigationService.didShowEditEventViewController) == true
                }
            }

            context("event creator did NOT successfully create event") {
                it("should tell navigation service to show no calendar permission alert") {
                    eventCreator.shouldReturnError = true
                    let testEvent = EventViewModel.testInstance
                    sut.didTapCalendarButton(for: testEvent)

                    expect(navigationService.didShowNoCalendarPermissionAlert) == true
                }
            }
        }

        describe("didTapOnCell(for event)") {
            it("should tell navigation service to show event detail screen") {
                let testEvent = EventViewModel.testInstance
                sut.didTapOnCell(at: 0, for: [testEvent])

                expect(navigationService.didShowPresentationDetailViewController) == true
            }
        }

        describe("didGetError(eventType)") {
            it("should tell navigation service to show error alert screen") {
                sut.didGetError(eventType: .workshops)

                expect(navigationService.didShowErrorAlert) == true
            }
        }

        describe("didTapCompanyButton(for company)") {
            it("should tell navigation service to show company detail view controller") {
                sut.didTapCompanyButton(for: CompanyViewModel.testInstance)

                expect(navigationService.didShowCompanyDetailViewController) == true
            }
        }
    }
}
