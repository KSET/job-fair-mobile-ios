import Foundation
@testable import JobFair

class EventStoreMock: EventStore {
    var didShowPresentations = false
    var didShowWorkshops = false

    override func showPresentations(with presenter: EventPresenter) {
        didShowPresentations = true
    }

    override func showWorkshops(with presenter: EventPresenter) {
        didShowWorkshops = true
    }
}
