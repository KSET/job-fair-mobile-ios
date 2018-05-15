import UIKit
import XLPagerTabStrip

class EventsViewController: ButtonBarPagerTabStripViewController {

    private lazy var firstDayViewController = EventListViewController(tabTitle: Constants.Events.dayOne, eventType: self.eventType)
    private lazy var secondDayViewController = EventListViewController(tabTitle: Constants.Events.dayTwo, eventType: self.eventType)
    private var coordinator: EventCoordinator!
    private let inProgressEventView = InProgressEventView()
    private let eventType: EventType
    private let stackView = UIStackView()

    private let buttonBarHeight: CGFloat = 60

    init(eventType: EventType) {
        self.eventType = eventType
        super.init(nibName: nil, bundle: nil)
        title = eventType.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setTabBar()
        super.viewDidLoad()
        coordinator = EventCoordinator(viewController: self)
        firstDayViewController.delegate = coordinator
        secondDayViewController.delegate = coordinator
        setSubviews()
        showLoadingView()
        coordinator?.viewDidLoad(eventType: eventType)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        inProgressEventView.layoutSubviews()
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
        addEventInProgressViewIfNeeded(for: events.higlightedEvent)
        removeLoadingView()
    }

    private func setTabBar() {
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.buttonBarItemTitleColor = .brandColor
        settings.style.buttonBarItemFont = .titleRegular
        settings.style.selectedBarHeight = 3
        settings.style.selectedBarBackgroundColor = .brandColor
        changeCurrentIndexProgressive = { (oldCell, newCell, progress, changeCurrentIndex, animated) in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .gray
            newCell?.label.textColor = .brandColor
        }
    }

    private func setSubviews() {
        setStackView()
        setInProgressView()
        setButtonBar()
        setContainerView()
    }

    private func setStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        view.addSubview(stackView)
        NSLayoutConstraint.activate(
            [
                stackView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
                stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        )
    }

    private func setInProgressView() {
        stackView.addArrangedSubview(inProgressEventView)
        inProgressEventView.isHidden = true
    }

    private func setButtonBar() {
        buttonBarView.removeFromSuperview()
        stackView.addArrangedSubview(buttonBarView)
        buttonBarView.translatesAutoresizingMaskIntoConstraints = false
        buttonBarView.tintColor = .brandColor
        NSLayoutConstraint.activate(
            [
                buttonBarView.heightAnchor.constraint(equalToConstant: buttonBarHeight)
            ]
        )
    }

    private func setContainerView() {
        containerView.removeFromSuperview()
        stackView.addArrangedSubview(containerView)
    }
    
    private func addEventInProgressViewIfNeeded(for event: EventViewModel?) {
        guard let inProgressEventViewModel = event else {
            return
        }

        inProgressEventView.isHidden = false
        inProgressEventView.viewModel = inProgressEventViewModel
    }
}
