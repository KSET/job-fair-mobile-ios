import Foundation

class EventPresenter {

    unowned var viewController: EventsViewController

    init(viewController: EventsViewController) {
        self.viewController = viewController
    }

    func showError() {
        viewController.showError()
    }

    func show(events: SortedEvents) {
        let sortedEvents = SortedEventsViewModel(events: events)
        viewController.show(events: sortedEvents)
    }
}
