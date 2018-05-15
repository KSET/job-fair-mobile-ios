import UIKit
import XLPagerTabStrip

protocol EventListDelegate: class {
    func didTapOnCell(at index: Int, for events: [EventViewModel])
    func didTapCalendarButton(for event: EventViewModel)
    func didPullToRefresh(eventType: EventType)
}

class EventListViewController: UITableViewController {

    weak var delegate: EventListDelegate?
    private let eventTableViewCellidentifier = "EventTableViewCellIdentifier"
    private let tabTitle: String
    private let eventType: EventType

    var events: [EventViewModel]? {
        didSet {
            tableView.reloadData()
        }
    }

    init(tabTitle: String, eventType: EventType) {
        self.tabTitle = tabTitle
        self.eventType = eventType
        super.init(style: .plain)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        addRefreshControl()
    }

    private func setTableView() {
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: eventTableViewCellidentifier)
        tableView.dataSource = self
        tableView.estimatedRowHeight = 112
        tableView.tableFooterView = UIView()
        tableView.cellLayoutMarginsFollowReadableWidth = false
        tableView.separatorStyle = .none
    }
    
    private func addRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didPullRefreshControl), for: .valueChanged)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
    }

    @objc
    private func didPullRefreshControl(_ refreshControl: UIRefreshControl) {
        refreshControl.endRefreshing()
        delegate?.didPullToRefresh(eventType: eventType)
    }
}

extension EventListViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: eventTableViewCellidentifier, for: indexPath) as? EventTableViewCell else {
            return .init()
        }

        cell.viewModel = events?[indexPath.row]
        cell.delegate = self

        return cell
    }
}

extension EventListViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let events = events else {
            return
        }

        delegate?.didTapOnCell(at: indexPath.row, for: events)
    }
}

extension EventListViewController: CalendarButtonDelegate {

    func didTapCalendarButton(for event: EventViewModel) {
        delegate?.didTapCalendarButton(for: event)
    }
}

extension EventListViewController: IndicatorInfoProvider {

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: tabTitle)
    }
}
