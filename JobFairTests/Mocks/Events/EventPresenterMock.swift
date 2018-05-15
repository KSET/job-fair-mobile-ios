@testable import JobFair

class EventPresenterMock: EventPresenter {
    var didShowError = false
    var didShowEvents = false
    var events: SortedEvents?

    init() {
        super.init(viewController: EventsViewController(eventType: .workshops))
    }

    override func showError() {
        didShowError = true
    }

    override func show(events: SortedEvents) {
        self.events = events
        didShowEvents = true
    }
}
