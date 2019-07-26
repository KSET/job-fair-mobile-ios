import UIKit

enum InfoCellType: Int {
    case stream = 0
    case social = 5
    case location = 4
}

class InfoViewController: UIViewController {
    
    var info = [InfoViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let tableFooterViewHeight: CGFloat = 100
    private let tableView = UITableView(frame: CGRect.zero, style: .grouped)
    private let infoDescriptionTableViewCellIdentifier = "InfoDescriptionTableViewCellIdentifier"
    private let infoSocialTableViewCellIdentifier = "InfoSocialTableViewCellIdentifier"
    private let infoStreamTableViewCellIdentifier = "InfoStreamTableViewCellIdentifier"
    private var coordinator: InfoCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.Social.title
        setTableView()
        coordinator = InfoCoordinator(viewController: self)
        coordinator?.viewDidLoad()
    }
    
    private func createHeaderView() -> UIView {
        let containerView = UIView(frame: .init(x: 0, y: 0, width: view.frame.width, height: 116))
        let headerImageView = UIImageView(image: UIImage(named: "login_logo"))
        headerImageView.contentMode = .scaleAspectFit
        headerImageView.clipsToBounds = true
        containerView.addSubview(headerImageView)
        headerImageView.pinAllEdges(to: containerView, padding: 24)
        return containerView
    }
    
    private func setTableView() {
        view.addSubview(tableView)
        tableView.pinAllEdges(to: view)
        
        tableView.register(InfoDescriptionTableViewCell.self, forCellReuseIdentifier: infoDescriptionTableViewCellIdentifier)
        tableView.register(InfoSocialTableViewCell.self, forCellReuseIdentifier: infoSocialTableViewCellIdentifier)
        tableView.register(InfoStreamTableViewCell.self, forCellReuseIdentifier: infoStreamTableViewCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.estimatedRowHeight = 120
        
        let footerView = UndabotStackView(frame: CGRect(x: 0, y: 0, width: 0, height: tableFooterViewHeight), tapHandler: { [weak self] in
            self?.coordinator?.didSelectUndabotWebsiteAction()
        })
        tableView.tableFooterView = footerView
        tableView.tableHeaderView = createHeaderView()
    }
    
    @objc private func didTapShareButton() {
        coordinator?.didSelectShareAction()
    }
}

extension InfoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case InfoCellType.social.rawValue:
            guard let infoSocialTableViewCell = tableView.dequeueReusableCell(withIdentifier: infoSocialTableViewCellIdentifier) as? InfoSocialTableViewCell  else {
                return UITableViewCell()
            }
            infoSocialTableViewCell.viewModel = info[indexPath.row]
            infoSocialTableViewCell.infoSocialTableViewCellDelegate = self
            return infoSocialTableViewCell
            
        case InfoCellType.stream.rawValue:
            guard let infoStreamTableViewCell = tableView.dequeueReusableCell(withIdentifier: infoStreamTableViewCellIdentifier) as? InfoStreamTableViewCell else {
                return UITableViewCell()
            }
            infoStreamTableViewCell.configure(with: self, title: info[indexPath.row].name)
            return infoStreamTableViewCell
            
        default:
            guard let infoDescriptionTableViewCell = tableView.dequeueReusableCell(withIdentifier: infoDescriptionTableViewCellIdentifier) as? InfoDescriptionTableViewCell  else {
                return UITableViewCell()
            }
            infoDescriptionTableViewCell.viewModel = info[indexPath.row]
            return infoDescriptionTableViewCell
        }
    }
}

extension InfoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == InfoCellType.location.rawValue {
            coordinator?.didSelectGoogleMapsAction()
        }
    }
}

extension InfoViewController: InfoSocialTableViewCellDelegate {
    
    func didSelectSocialNetworkWithLink(_ url: URL) {
        coordinator?.didSelectOpenURLAction(url)
    }
}

extension InfoViewController: InfoStreamTableViewCellDelegate {
    
    func didSelectDayOneStreamAction() {
        coordinator.didSelectDayOneStreamAction()
    }
    
    func didSelectDayTwoStreamAction() {
        coordinator.didSelectDayTwoStreamAction()
    }
}
