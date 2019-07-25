import Foundation

struct SortedEventsViewModel {
    let firstDayEvent: [EventViewModel]
    let secondDayEvent: [EventViewModel]

    init(events: SortedEvents) {
        firstDayEvent = events.firstDayEvents.compactMap { EventViewModel(event: $0) }
        secondDayEvent = events.secondDayEvents.compactMap { EventViewModel(event: $0) }
    }
}
