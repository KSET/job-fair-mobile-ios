import Foundation

class EventCoordinator {

    var eventStore = EventStore()
    var eventCreator = CalendarEventCreator()
    var navigationService: EventNavigationService
    private let presenter: EventPresenter

    init(viewController: EventsViewController) {
        presenter = EventPresenter(viewController: viewController)
        navigationService = EventNavigationService(navigationController: viewController.navigationController)
    }

    func viewDidLoad(eventType: EventType) {
        switch eventType {
        case .presentations:
            eventStore.showPresentations(with: presenter)
        case .workshops:
            eventStore.showWorkshops(with: presenter)
        }
    }

    func didGetError(eventType: EventType) {
        navigationService.showErrorAlert { [weak self] in
            self?.viewDidLoad(eventType: eventType)
        }
    }
}

extension EventCoordinator: EventListDelegate {

    func didTapCalendarButton(for event: EventViewModel) {
        eventCreator.createCalendarEvent(for: event) { [unowned navigationService] calendarEvent in
            guard let calendarEvent = calendarEvent else {
                navigationService.showNoCalendarPermissionAlert()
                return
            }

            navigationService.presentEditEventViewController(for: calendarEvent)
        }
    }

    func didTapOnCell(at index: Int, for events: [EventViewModel]) {
        navigationService.showEventPager(at: index, for: events, delegate: self)
    }

    func didPullToRefresh(eventType: EventType) {
        viewDidLoad(eventType: eventType)
    }
}

extension EventCoordinator: EventViewDelegate {
    
    func didTapCompanyButton(for company: CompanyViewModel) {
        navigationService.showCompanyDetailsViewController(for: company)
    }
}
