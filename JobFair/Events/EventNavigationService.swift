import Foundation
import UIKit
import EventKitUI

class EventNavigationService: BaseNavigationService {

    func presentEditEventViewController(for customEvent: CalendarEvent) {
        let viewController = EKEventEditViewController()
        viewController.editViewDelegate = self
        viewController.event = customEvent.event
        viewController.eventStore = customEvent.eventStore
        navigationController?.present(viewController, animated: true, completion: nil)
    }

    func showCompanyDetailsViewController(for company: CompanyViewModel) {
        let companyDetailsViewController = CompanyDetailsViewController(company: company)
        navigationController?.pushViewController(companyDetailsViewController, animated: true)
    }

    func showEventPager(at index: Int, for events: [EventViewModel], delegate: EventViewDelegate?) {
        let pagerViewController = EventsPagerViewController(eventIndex: index, events: events)
        pagerViewController.eventViewDelegate = delegate
        let jobFairPager = JobFairPageViewController(pager: pagerViewController)
        navigationController?.pushViewController(jobFairPager, animated: true)
    }

    func showNoCalendarPermissionAlert() {
        let alertViewController = UIAlertController(title: "No permission!", message: "We don't have permission to access your Calendar", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        alertViewController.addAction(closeAction)
        navigationController?.present(alertViewController, animated: true, completion: nil)
    }
}

extension EventNavigationService: EKEventEditViewDelegate {

    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        controller.dismiss(animated: true, completion: nil)
    }
}
