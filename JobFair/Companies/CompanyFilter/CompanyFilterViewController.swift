import UIKit

protocol CompanyFilterViewControllerDelegate: class {
    func didSelectIndustry(_ industryId: String)
}

class CompanyFilterViewController: UIViewController {
    private let industryTableViewCellIdentifier = "IndustryTableViewCell"
    private weak var companyFilterViewControllerDelegate: CompanyFilterViewControllerDelegate?
    private var coordinator: CompanyFilterCoordinator!
    private let itemSpacing: CGFloat = 8
    private let tableView = UITableView(frame: CGRect.zero, style: .plain)
    private let collectionViewTopPadding: CGFloat = .systemPadding
    private var currentIndustryId: String
    
    var industries = [IndustryViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(companyFilterViewControllerDelegate: CompanyFilterViewControllerDelegate?, currentIndustryId: String) {
        self.companyFilterViewControllerDelegate = companyFilterViewControllerDelegate
        self.currentIndustryId = currentIndustryId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setDefaultNavigationBarAppearance()
        coordinator = CompanyFilterCoordinator(viewController: self, navigationController: navigationController)
        title = Constants.Industries.title
        setupUI()
        coordinator.viewDidLoad()
    }

    func showError() {
        coordinator.didGetError()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        setTableView()
        setCloseButton()
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(IndustryTableViewCell.self, forCellReuseIdentifier: industryTableViewCellIdentifier)
        tableView.separatorStyle = .none
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.pinAllEdges(to: view)
    }
    
    private func setCloseButton() {
        let closeBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close"), style: .plain, target: coordinator, action: #selector(didTapCloseButton))
        navigationItem.leftBarButtonItem = closeBarButtonItem
    }
    
    @objc func didTapCloseButton() {
        coordinator.didSelectDismissAction()
    }
}

extension CompanyFilterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return industries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let industryTableViewCell = tableView.dequeueReusableCell(withIdentifier: industryTableViewCellIdentifier) as? IndustryTableViewCell else {
            return UITableViewCell()
        }
        
        let industry = industries[indexPath.row]
        let isCurrent = industry.id == currentIndustryId
        industryTableViewCell.configureCell(with: industry, isCurrent: isCurrent)
        return industryTableViewCell
    }
}

extension CompanyFilterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let industry = industries[indexPath.row]
        companyFilterViewControllerDelegate?.didSelectIndustry(industry.id)
        currentIndustryId = industry.id
        tableView.reloadData()
        coordinator.didSelectIndustry()
    }
}
