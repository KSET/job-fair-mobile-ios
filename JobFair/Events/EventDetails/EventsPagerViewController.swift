import UIKit

class EventsPagerViewController: UIPageViewController {

    private let events: [EventViewModel]
    private let eventIndex: Int
    
    weak var eventViewDelegate: EventViewDelegate?

    init(eventIndex: Int, events: [EventViewModel]) {
        self.events = events
        self.eventIndex = eventIndex
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        dataSource = self
        let initialEventViewController = createEventViewController(for: events[eventIndex])
        setViewControllers([initialEventViewController], direction: .forward, animated: false, completion: nil)
    }
    
    private func createEventViewController(for event: EventViewModel) -> EventViewController {
        let viewController = EventViewController(event: event)
        viewController.eventViewDelegate = eventViewDelegate
        
        return viewController
    }
}

extension EventsPagerViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let eventViewController = viewController as? EventViewController else {
            return nil
        }

        if let previousItem = events.before(item: eventViewController.event) {
            return createEventViewController(for: previousItem)
        }

        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let eventViewController = viewController as? EventViewController else {
            return nil
        }

        if let nextItem = events.after(item: eventViewController.event) {
            return createEventViewController(for: nextItem)
        }

        return nil
    }
}

extension EventsPagerViewController: Swipeable {

    func showNextPage() {
        guard let currentViewController = viewControllers?.first,
            let nextViewController = pageViewController(self, viewControllerAfter: currentViewController) else {
            return
        }

        setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
    }

    func showPreviousPage() {
        guard let currentViewController = viewControllers?.first,
            let previousViewController = pageViewController(self, viewControllerBefore: currentViewController) else {
                return
        }

        setViewControllers([previousViewController], direction: .reverse, animated: true, completion: nil)
    }

    var hasNext: Bool {
        guard let currentViewController = viewControllers?.first as? EventViewController,
            let eventIndex = events.index(of: currentViewController.event) else {
            return false
        }

        return eventIndex < events.count - 1
    }

    var hasPrevious: Bool {
        guard let currentViewController = viewControllers?.first as? EventViewController,
            let eventIndex = events.index(of: currentViewController.event) else {
                return false
        }

        return eventIndex > 0
    }
}
