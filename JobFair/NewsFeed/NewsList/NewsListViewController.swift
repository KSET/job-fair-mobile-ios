import UIKit

class NewsListViewController: UIViewController {
    var coordinator: NewsListCoordinator!
    
    fileprivate let refreshControl = UIRefreshControl()
    fileprivate let tableView = UITableView()
    fileprivate let NewsListTableViewCellIdentifier = "NewsListTableViewCellIdentifier"
    fileprivate let FeaturedNewsListTableViewCellIdentifier = "FeaturedNewsListTableViewCellIdentifier"
    
    fileprivate let featuredNewsListCellHeight: CGFloat = 250
    
    var news: [NewsViewModel] = [NewsViewModel]() {
        didSet {
            removeLoadingView()
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.News.title
        view.backgroundColor = .white
        setTableView()
        setRefreshControl()
        showLoadingView()
        coordinator = NewsListCoordinator(viewController: self)
        coordinator.viewDidLoad()
    }
    
    private func setTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.pinAllEdges(to: view)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FeaturedNewsListTableViewCell.self, forCellReuseIdentifier: FeaturedNewsListTableViewCellIdentifier)
        tableView.register(NewsListTableViewCell.self, forCellReuseIdentifier: NewsListTableViewCellIdentifier)
        tableView.separatorStyle = .none
    }
    
    private func setRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshNewsList), for: UIControlEvents.valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc private func refreshNewsList() {
        refreshControl.endRefreshing()
        coordinator.didPullToRefresh()
    }
    
    func show(news: [NewsViewModel]) {
        self.news = news
    }
    
    func showError() {
        removeLoadingView()
        coordinator.didGetError()
    }
}

extension NewsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0,
            let cell = tableView.dequeueReusableCell(withIdentifier: FeaturedNewsListTableViewCellIdentifier, for: indexPath) as? FeaturedNewsListTableViewCell {
            cell.news = news.first
            return cell
        } else if let cell = tableView.dequeueReusableCell(withIdentifier: NewsListTableViewCellIdentifier, for: indexPath) as? NewsListTableViewCell {
            cell.news = news[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? featuredNewsListCellHeight : UITableViewAutomaticDimension
    }
}

extension NewsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator.didTapNewsItem(newsItems: news, selectedIndex: indexPath.row)
    }
}
