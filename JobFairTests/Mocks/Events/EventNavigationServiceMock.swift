import Foundation
@testable import JobFair

class EventNavigationServiceMock: EventNavigationService {
    var didShowEditEventViewController = false
    var didShowPresentationDetailViewController = false
    var didShowErrorAlert = false
    var didShowNoCalendarPermissionAlert = false
    var didShowCompanyDetailViewController = false

    override func presentEditEventViewController(for event: CalendarEvent) {
        didShowEditEventViewController = true
    }

    override func showEventPager(at index: Int, for events: [EventViewModel], delegate: EventViewDelegate?) {
        didShowPresentationDetailViewController = true
    }

    override func showErrorAlert(retryCompletion: (() -> Void)?) {
        didShowErrorAlert = true
    }

    override func showNoCalendarPermissionAlert() {
        didShowNoCalendarPermissionAlert = true
    }

    override func showCompanyDetailsViewController(for company: CompanyViewModel) {
        didShowCompanyDetailViewController = true
    }
}
