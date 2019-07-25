import UIKit

protocol CompanyFilterViewControllerDelegate: class {
    func didSelectIndustry(_ industry: IndustryViewModel)
    func showErrorDialog()
}

class CompanyFilterViewController: UIViewController {
    
    private let industryTableViewCellIdentifier = "IndustryTableViewCell"
    private weak var delegate: CompanyFilterViewControllerDelegate?
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
    
    init(delegate: CompanyFilterViewControllerDelegate?, currentIndustryId: String) {
        self.delegate = delegate
        self.currentIndustryId = currentIndustryId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = CompanyFilterCoordinator(viewController: self)
        title = Constants.Industries.title
        setupUI()
        coordinator.viewDidLoad()
    }

    func showError() {
        delegate?.showErrorDialog()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addBorder()
        view.addCornerRadius()
        view.layer.borderColor = UIColor.brandColor.cgColor
        setTableView()
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = .zero
        tableView.register(IndustryTableViewCell.self, forCellReuseIdentifier: industryTableViewCellIdentifier)
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.pinAllEdges(to: view)
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
        industryTableViewCell.configureCell(with: industry, isFirst: indexPath.row == 0, isCurrent: isCurrent)
        return industryTableViewCell
    }
}

extension CompanyFilterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let industry = industries[indexPath.row]
        delegate?.didSelectIndustry(industry)
        currentIndustryId = industry.id
        tableView.reloadData()
    }
}
