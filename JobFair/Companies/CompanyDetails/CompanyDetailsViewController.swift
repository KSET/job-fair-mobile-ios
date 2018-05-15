import UIKit

class CompanyDetailsViewController: UIViewController {
    
    private var companyDetailsStackView = CompanyDetailsStackView()
    private var logoScrollViewHeightConstraint: NSLayoutConstraint!
    private var tableView = UITableView(frame: CGRect.zero, style: .plain)
    private let companyDetailsTableViewCellIdentifier = "CompanyDetailsTableViewCellIdentifier"
    private var coordinator: CompanyDetailsCoordinator!
    private var logoScrollView = UIScrollView()
    private var shadowView = UIView()
    private var headerStackViewVerticalHeight = CGFloat()
    private var headerStackViewHorizontalHeight = CGFloat()
    private let buttonsStackViewHeight: CGFloat = 70
    
    let company: CompanyViewModel
    
    init(company: CompanyViewModel) {
        self.company = company
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = CompanyDetailsCoordinator(navigationController: navigationController)
        headerStackViewVerticalHeight = 0.4 * view.frame.height
        headerStackViewHorizontalHeight = 0.25 * view.frame.height
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        setLogoScrollView()
        setShadowView()
        setTableView()
        setHeaderStackView()
    }
    
    private func setLogoScrollView() {
        logoScrollView.backgroundColor = .white
        logoScrollView.showsVerticalScrollIndicator = false
        logoScrollView.delegate = self
        logoScrollView.bounces = false
        
        view.addSubview(logoScrollView)
        logoScrollView.translatesAutoresizingMaskIntoConstraints = false
        logoScrollViewHeightConstraint = logoScrollView.heightAnchor.constraint(equalToConstant: headerStackViewVerticalHeight)
        NSLayoutConstraint.activate([
            logoScrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            logoScrollViewHeightConstraint,
            logoScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setShadowView() {
        shadowView.backgroundColor = .gray
        view.addSubview(shadowView)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: logoScrollView.bottomAnchor),
            shadowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            shadowView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    private func setTableView() {
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .systemPadding),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.systemPadding),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: shadowView.bottomAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CompanyDetailsTableViewCell.self, forCellReuseIdentifier: companyDetailsTableViewCellIdentifier)
    }
    
    private func setHeaderStackView() {
        companyDetailsStackView.viewModel = company
        companyDetailsStackView.companyDetailsStackViewDelegate = self
        
        logoScrollView.addSubview(companyDetailsStackView)
        companyDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            companyDetailsStackView.topAnchor.constraint(equalTo: logoScrollView.topAnchor),
            companyDetailsStackView.bottomAnchor.constraint(equalTo: logoScrollView.bottomAnchor),
            companyDetailsStackView.leadingAnchor.constraint(equalTo: logoScrollView.leadingAnchor),
            companyDetailsStackView.trailingAnchor.constraint(equalTo: logoScrollView.trailingAnchor),
            companyDetailsStackView.widthAnchor.constraint(equalTo: logoScrollView.widthAnchor),
            companyDetailsStackView.heightAnchor.constraint(equalTo: logoScrollView.heightAnchor, constant: 10)
        ])
    }
    
    private func animateStackView(with axis: UILayoutConstraintAxis) {
        companyDetailsStackView.animate(with: axis)
        logoScrollViewHeightConstraint.constant = axis == .horizontal ? headerStackViewHorizontalHeight : headerStackViewVerticalHeight
        
        UIView.animate(withDuration: 0.25, animations: {
            self.view.layoutIfNeeded()
        })
    }
}

extension CompanyDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return company.companyDetails.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let companyDetailsTableViewCell = tableView.dequeueReusableCell(withIdentifier: companyDetailsTableViewCellIdentifier) as? CompanyDetailsTableViewCell else {
            return UITableViewCell()
        }
       
        let companyDetail = company.companyDetails[indexPath.row]
        companyDetailsTableViewCell.configureCell(with: companyDetail.name, and: companyDetail.value)
        return companyDetailsTableViewCell
    }
}

extension CompanyDetailsViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let velocity = scrollView.panGestureRecognizer.velocity(in: view)
        
        guard velocity.y != 0 else {
            return
        }
        
        let axis: UILayoutConstraintAxis = velocity.y < 0 ? .horizontal : .vertical
        animateStackView(with: axis)
    }
}

extension CompanyDetailsViewController: CompanyDetailsStackViewDelegate {
    
    func didSelectWebsiteAction() {
        coordinator.didSelectOpenURLAction(websiteUrlString: company.websiteUrlString)
    }
    
    func didSelectBoothLocationAction() {
        coordinator.didTapBoothLocationButton(companyId: company.id)
    }
}
