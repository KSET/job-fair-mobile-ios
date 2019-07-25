import UIKit
import XLPagerTabStrip

class EventsViewController: XLPagerViewController {

    private lazy var firstDayViewController = EventListViewController(tabTitle: Constants.Events.dayOne, eventType: eventType)
    private lazy var secondDayViewController = EventListViewController(tabTitle: Constants.Events.dayTwo, eventType: eventType)
    private var coordinator: EventCoordinator!
    private let eventType: EventType

    init(eventType: EventType, navigationController: UINavigationController?) {
        self.eventType = eventType
        super.init()
        coordinator = EventCoordinator(viewController: self, navigationController: navigationController)
        title = eventType.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setTabBar()
        super.viewDidLoad()
        firstDayViewController.delegate = coordinator
        secondDayViewController.delegate = coordinator
        showLoadingView()
        coordinator?.viewDidLoad(eventType: eventType)
    }

    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [firstDayViewController, secondDayViewController]
    }

    func showError() {
        coordinator?.didGetError(eventType: eventType)
    }

    func show(events: SortedEventsViewModel) {
        firstDayViewController.events = events.firstDayEvent
        secondDayViewController.events = events.secondDayEvent
        removeLoadingView()
    }

    private func setTabBar() {
        settings.style.buttonBarLeftContentInset = (view.frame.width / 2) - 53
        settings.style.buttonBarRightContentInset = (view.frame.width / 2) - 53
    }
}

extension EventsViewController: IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: eventType.title.uppercased())
    }
}
