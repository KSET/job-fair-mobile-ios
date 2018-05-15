import Foundation
@testable import JobFair

class EventCreatorMock: CalendarEventCreator {
    var didCreateEvent = false
    var shouldReturnError = false

    override func createCalendarEvent(for presentation: EventViewModel, completion: @escaping ((CalendarEvent?) -> Void)) {
        didCreateEvent = true
        if shouldReturnError {
            completion(nil)
        } else {
            completion(CalendarEvent.testInstance)
        }
    }
}
