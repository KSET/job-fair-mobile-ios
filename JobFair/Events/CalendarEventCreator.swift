import Foundation
import EventKit
import RxSwift

class CalendarEventCreator {

    private lazy var store = EKEventStore()
    private let alarmOffset: Double = 15 * 60 // 15 min (15*60)

    func createCalendarEvent(for event: EventViewModel, completion: @escaping ((CalendarEvent?) -> Void)) {
        getCalendarPermissions { [weak self] permissionGranted in
            guard permissionGranted else {
                completion(nil)
                return
            }
            self?.createEvent(for: event, completion: completion)
        }
    }

    private func getCalendarPermissions(completion: @escaping ((Bool) -> Void)) {
        store.requestAccess(to: .event) { granted, _ in
            completion(granted)
        }
    }

    private func createEvent(for event: EventViewModel, completion: ((CalendarEvent?) -> Void)) {
        let customEvent = EKEvent(eventStore: store)
        customEvent.title = "\(event.company.name) - \(event.title)"
        customEvent.startDate = event.startDate
        customEvent.endDate = event.endDate
        customEvent.location = event.location
        customEvent.notes = event.lecturerDescription

        let alarm = EKAlarm(absoluteDate: event.startDate.addingTimeInterval(-alarmOffset))
        customEvent.addAlarm(alarm)

        completion(CalendarEvent(event: customEvent, eventStore: store))
    }
}
