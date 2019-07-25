import Foundation
@testable import JobFair

class EventsViewControllerMock: EventsViewController {

    var didShowError = false
    var didShowEvents = false

    init() {
        super.init(eventType: .workshops, navigationController: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func showError() {
        didShowError = true
    }

    override func show(events: SortedEventsViewModel) {
        didShowEvents = true
    }
}
