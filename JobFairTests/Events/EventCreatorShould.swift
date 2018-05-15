import Quick
import Nimble
import EventKit
@testable import JobFair

class EventCreatorShould: QuickSpec {

    override func spec() {
        var sut: CalendarEventCreator!

        beforeEach {
            sut = CalendarEventCreator()
        }

        afterEach {
            sut = nil
        }

        describe("createEvent(for event: PresentationViewModel, completion: ((EKEvent?) -> Void))") {
            it("should create event from event") {
                let presentation = EventViewModel.testInstance
                
                waitUntil { done in
                    sut.createCalendarEvent(for: presentation) { customEvent in
                        let event = customEvent?.event
                        expect(event?.title) == presentation.company.name + " - " + presentation.title
                        expect(event?.startDate) ≈ (presentation.endDate, 1)
                        expect(event?.endDate) ≈ (presentation.endDate, 1)
                        expect(event?.notes) == presentation.lecturerDescription
                        expect(event?.alarms?[0].absoluteDate) == event?.startDate.addingTimeInterval(-900)
                        done()
                    }
                }
            }
        }
    }
}
