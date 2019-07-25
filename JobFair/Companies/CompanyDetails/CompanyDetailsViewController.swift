import UIKit

class CompanyDetailsViewController: UIViewController {
    
    private var coordinator: CompanyDetailsCoordinator!
    private let headerView = HeaderView()
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    private let websiteButton = UIButton.primaryButton
    private let boothLocationButton = UIButton.primaryButton
    
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
        title = Constants.Companies.title
        coordinator = CompanyDetailsCoordinator(navigationController: navigationController)
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        setupScrollView()
        setupHeaderView()
        setupButtons()
        addDescriptionViews()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(headerView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view)
        }
    }
    
    private func setupHeaderView() {
        headerView.dateLabel.isHidden = true
        headerView.timeLabel.isHidden = true
        headerView.titleLabel.text = company.name
        headerView.imageView.kf.setImage(with: company.logoUrl)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CGFloat.systemPadding)
            make.leading.equalToSuperview().offset(CGFloat.systemPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.systemPadding)
            make.height.equalTo(150)
        }
    }
    
    private func setupButtons() {
        boothLocationButton.titleLabel?.lineBreakMode = .byTruncatingTail
        boothLocationButton.titleLabel?.font = .cellTitleMedium
        boothLocationButton.setTitle("\(Constants.Companies.boothButtonTitle) \(company.boothLocation)", for: .normal)
        boothLocationButton.addTarget(self, action: #selector(didSelectBoothLocationAction), for: .touchUpInside)
        websiteButton.titleLabel?.font = .cellTitleMedium
        websiteButton.setTitle(Constants.Companies.websiteButtonTitle, for: .normal)
        websiteButton.addTarget(self, action: #selector(didSelectWebsiteAction), for: .touchUpInside)
        setupButtonStackView()
    }
    
    private func setupButtonStackView() {
        let stackView = UIStackView(arrangedSubviews: [boothLocationButton, websiteButton])
        stackView.distribution = .fillEqually
        stackView.spacing = .systemPadding
        containerView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(CGFloat.systemPadding * 2)
            make.leading.trailing.equalTo(headerView)
            make.height.equalTo(36)
        }
    }
    
    private func addDescriptionViews() {
        let views = company.companyDetails.map { details -> ParagraphView in
            let view = ParagraphView()
            view.configureView(with: details.name, and: details.value)
            return view
        }
        
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .vertical
        containerView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(boothLocationButton.snp.bottom).offset(CGFloat.systemPadding * 2)
            make.leading.trailing.equalTo(headerView)
            make.bottom.equalToSuperview().offset(-CGFloat.systemPadding)
        }
    }
    
    @objc
    private func didSelectWebsiteAction() {
        coordinator.didSelectOpenURLAction(websiteUrlString: company.websiteUrlString)
    }
    
    @objc
    private func didSelectBoothLocationAction() {
        coordinator.didTapBoothLocationButton(companyId: company.id)
    }
}
