import UIKit

class EventCoordinator {

    var eventStore = EventStore()
    var eventCreator = CalendarEventCreator()
    var navigationService: EventNavigationService
    private let presenter: EventPresenter

    // needs to receive navigation controller through initializer because navigation controller is not properly linked to view controller
    //(issue with XLPagerTabStrip)
    init(viewController: EventsViewController, navigationController: UINavigationController?) {
        presenter = EventPresenter(viewController: viewController)
        navigationService = EventNavigationService(navigationController: navigationController)
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
    
    func didTapRateView(for event: EventViewModel, rating: Double) {
        eventStore.rateEvent(eventType: event.type, eventId: event.id, rating: rating)
    }
    
    func didTapEventLocationButton(for location: Geolocation) {
        navigationService.showBoothsViewController(at: location)
    }
    
    func didTapCompanyButton(for company: CompanyViewModel) {
        navigationService.showCompanyDetailsViewController(for: company)
    }
}
