import UIKit

enum InfoCellType: Int {
    case stream = 2
    case social = 3
    case location = 5
}

class InfoViewController: UIViewController {
    var info = [InfoViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let socialCellHeight: CGFloat = 216
    private let tableFooterViewHeight: CGFloat = 100
    private let tableView = UITableView(frame: CGRect.zero, style: .grouped)
    private let infoDescriptionTableViewCellIdentifier = "InfoDescriptionTableViewCellIdentifier"
    private let infoSocialTableViewCellIdentifier = "InfoSocialTableViewCellIdentifier"
    private let infoStreamTableViewCellIdentifier = "InfoStreamTableViewCellIdentifier"
    private var coordinator: InfoCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTableView()
        coordinator = InfoCoordinator(viewController: self)
        coordinator?.viewDidLoad()
    }
    
    private func setNavigationBar() {
        navigationController?.navigationBar.barTintColor = .brandColor
        navigationController?.navigationBar.isTranslucent = false
        setCloseBarButtonItem()
        setShareBarButton()
    }
    
    private func setCloseBarButtonItem() {
        let closeBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(didTapCloseButton))
        navigationItem.leftBarButtonItem = closeBarButtonItem
    }
    
    private func setShareBarButton() {
        let shareBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "share").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(didTapShareButton))
        navigationItem.rightBarButtonItem = shareBarButtonItem
    }
    
    private func createHeaderView() -> UIImageView {
        let headerImageView = UIImageView(image: #imageLiteral(resourceName: "launch_image"))
        headerImageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.25)
        headerImageView.backgroundColor = .brandColor
        headerImageView.contentMode = .scaleAspectFit
        headerImageView.clipsToBounds = true
        return headerImageView
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
        tableView.bounces = false
        
        let footerView = UndabotStackView(frame: CGRect(x: 0, y: 0, width: 0, height: tableFooterViewHeight), tapHandler: { [weak self] in
            self?.coordinator?.didSelectUndabotWebsiteAction()
        })
        tableView.tableFooterView = footerView
        tableView.tableHeaderView = createHeaderView()
    }
    
    @objc private func didTapCloseButton() {
        coordinator?.didSelectDismissAction()
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case InfoCellType.social.rawValue:
            return socialCellHeight
        default:
            return UITableViewAutomaticDimension
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
