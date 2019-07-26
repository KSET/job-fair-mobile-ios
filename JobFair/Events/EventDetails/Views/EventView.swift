import UIKit
import Kingfisher
import Cosmos

protocol EventViewDelegate: class {
    func didTapEventLocationButton(for location: Geolocation)
    func didTapCompanyButton(for company: CompanyViewModel)
    func didTapCalendarButton(for event: EventViewModel)
    func didTapRateView(for event: EventViewModel, rating: Double)
}

class EventView: UIScrollView {

    private let contentView = UIView()
    private let titleHeaderLabel = UILabel()
    private let titleLabel = UILabel()
    private let headerView = HeaderView()
    private let companyDetailsButton = UIButton.primaryButton
    private let eventLocationButton = UIButton.primaryButton
    private let descriptionView = ParagraphView()
    private let presenterBioView = ParagraphView()
    private let rateHeaderLabel = UILabel()
    private let rateView = CosmosView()
    
    weak var viewDelegate: EventViewDelegate?

    var viewModel: EventViewModel? {
        didSet {
            titleHeaderLabel.text = viewModel?.eventTitle.uppercased()
            titleLabel.text = viewModel?.title
            headerView.dateLabel.text = viewModel?.startDateString
            headerView.timeLabel.text = viewModel?.startTimeString
            descriptionView.configureView(with: Constants.Events.descriptionHeader, and: viewModel?.description)
            presenterBioView.configureView(with: Constants.Events.biographyHeader, and: viewModel?.lecturerDescription)
            eventLocationButton.setTitle("\(Constants.Events.eventLocationButtonTitle) \(viewModel?.location ?? "")", for: .normal)
            
            let imageUrl = viewModel?.lecturerImageUrl ?? viewModel?.company.logoUrl
            headerView.imageView.kf.setImage(with: imageUrl)
            hideRateViewIfNeeded()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        setupContentView()
        setupTitleHeaderLabel()
        setupTitleLabel()
        setupHeaderView()
        setupButtons()
        setupRateHeaderLabel()
        setupRateView()
        setupDescriptionView()
        setupPresenterBioView()
    }
    
    private func setupContentView() {
        addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    private func setupTitleHeaderLabel() {
        titleHeaderLabel.font = .headerTitle
        titleHeaderLabel.textColor = .secondaryColor
        contentView.addSubview(titleHeaderLabel)
        titleHeaderLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CGFloat.systemPadding)
            make.leading.equalToSuperview().offset(CGFloat.systemPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.systemPadding)
        }
    }
    
    private func setupTitleLabel() {
        titleLabel.font = .titleLarge
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleHeaderLabel.snp.bottom).offset(CGFloat.smallPadding)
            make.leading.equalToSuperview().offset(CGFloat.systemPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.systemPadding)
        }
    }
    
    private func setupHeaderView() {
        headerView.titleLabel.isHidden = true
        contentView.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(CGFloat.systemPadding)
            make.height.equalTo(150)
            make.leading.equalToSuperview().offset(CGFloat.systemPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.systemPadding)
        }
    }
    
    private func setupButtons() {
        setupButtonStackView()
        eventLocationButton.titleLabel?.lineBreakMode = .byTruncatingTail
        eventLocationButton.titleLabel?.font = .cellTitleMedium
        eventLocationButton.addTarget(self, action: #selector(didTapEventLocationButton), for: .touchUpInside)
        companyDetailsButton.titleLabel?.font = .cellTitleMedium
        companyDetailsButton.setTitle(Constants.Events.companyDetailsButtonTitle, for: .normal)
        companyDetailsButton.addTarget(self, action: #selector(didTapCompanyButton), for: .touchUpInside)
    }
    
    private func setupButtonStackView() {
        let stackView = UIStackView(arrangedSubviews: [eventLocationButton, companyDetailsButton])
        stackView.distribution = .fillEqually
        stackView.spacing = .systemPadding
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(CGFloat.systemPadding * 2)
            make.leading.trailing.equalTo(headerView)
            make.height.equalTo(36)
        }
    }
    
    private func setupRateHeaderLabel() {
        rateHeaderLabel.text = Constants.Events.rateHeader.uppercased()
        rateHeaderLabel.font = .contentBold
        rateHeaderLabel.textColor = .secondaryColor
        contentView.addSubview(rateHeaderLabel)
        rateHeaderLabel.snp.makeConstraints { make in
            make.top.equalTo(companyDetailsButton.snp.bottom).offset(CGFloat.systemPadding * 2)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupRateView() {
        rateView.rating = 0
        contentView.addSubview(rateView)
        rateView.didFinishTouchingCosmos = { [weak self] rating in
            guard let viewModel = self?.viewModel else {
                return
            }
            self?.viewDelegate?.didTapRateView(for: viewModel, rating: rating)
        }
        
        rateView.snp.makeConstraints { make in
            make.top.equalTo(rateHeaderLabel.snp.bottom).offset(CGFloat.smallPadding)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupDescriptionView() {
        contentView.addSubview(descriptionView)
        descriptionView.snp.makeConstraints { make in
            make.top.equalTo(rateView.snp.bottom).offset(CGFloat.systemPadding * 2)
            make.leading.equalToSuperview().offset(CGFloat.systemPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.systemPadding)
        }
    }
    
    private func setupPresenterBioView() {
        contentView.addSubview(presenterBioView)
        presenterBioView.snp.makeConstraints { make in
            make.top.equalTo(descriptionView.snp.bottom).offset(CGFloat.systemPadding)
            make.leading.equalToSuperview().offset(CGFloat.systemPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.systemPadding)
            make.bottom.equalToSuperview()
        }
    }
    
    private func hideRateViewIfNeeded() {
        guard viewModel?.shouldShowRateView == false else {
            return
        }
        
        rateView.isHidden = true
        rateView.snp.makeConstraints { (make) in
            make.height.equalTo(0)
        }
        
        rateHeaderLabel.snp.makeConstraints { (make) in
            make.height.equalTo(0)
        }
    }

    @objc
    private func didTapCompanyButton() {
        guard let company = viewModel?.company else {
            return
        }
        viewDelegate?.didTapCompanyButton(for: company)
    }
    
    @objc
    private func didTapEventLocationButton() {
        guard let geolocation = viewModel?.geolocation else {
            return
        }
        viewDelegate?.didTapEventLocationButton(for: geolocation)
    }
}
