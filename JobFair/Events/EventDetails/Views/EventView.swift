import UIKit
import Kingfisher

protocol EventViewDelegate: CalendarButtonDelegate {
    func didTapCompanyButton(for company: CompanyViewModel)
}

class EventView: UIScrollView {

    private let mainStackView = UIStackView()
    private let headerView = EventHeaderView()
    private let lecturerHeaderLabel = UILabel()
    private let lecturerStackView = UIStackView()
    private let lecturerDescriptionLabel = UILabel()
    private let lecturerImageView = UIImageView()
    private let eventDescriptionLabel = UILabel()
    private let companyButton = UIButton(type: .custom)
    private let lecturerImageViewHeight: CGFloat = 40
    private let padding: CGFloat = 32
    private let minCompanyButtonHeight: CGFloat = 40
    
    weak var viewDelegate: EventViewDelegate? {
        didSet {
            headerView.delegate = viewDelegate
        }
    }

    var viewModel: EventViewModel? {
        didSet {
            headerView.viewModel = viewModel
            eventDescriptionLabel.text = viewModel?.description

            lecturerImageView.kf.setImage(with: viewModel?.lecturerImageUrl, placeholder: #imageLiteral(resourceName: "presenter_placeholder"))
            lecturerDescriptionLabel.text = viewModel?.lecturerDescription
            lecturerStackView.isHidden = viewModel?.lecturerDescription == nil
            lecturerHeaderLabel.isHidden = viewModel?.lecturerDescription == nil
            let buttonTitle = String(format: Constants.Events.moreAboutCompany, viewModel?.company.name.uppercased() ?? "")
            companyButton.setTitle(buttonTitle, for: .normal)
            setCompanyButtonSize()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setView() {
        eventDescriptionLabel.numberOfLines = 0
        eventDescriptionLabel.textColor = .darkGray
        eventDescriptionLabel.setLineSpacing(lineSpacing: 1.2)
        setLecturerStackView()
        setMainStackView()
        setCompanyButton()
        createConstraints()
    }
    
    private func setLecturerStackView() {
        lecturerHeaderLabel.text = Constants.Events.presenter
        lecturerHeaderLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        lecturerDescriptionLabel.numberOfLines = 0
        lecturerDescriptionLabel.textColor = .darkGray
        lecturerImageView.translatesAutoresizingMaskIntoConstraints = false
        lecturerImageView.contentMode = .scaleAspectFit
        lecturerImageView.clipsToBounds = true
        lecturerImageView.layer.cornerRadius = 2
        lecturerStackView.addArrangedSubview(lecturerImageView)
        lecturerStackView.addArrangedSubview(lecturerDescriptionLabel)
        lecturerStackView.alignment = .top
        lecturerStackView.spacing = .systemPadding
    }

    private func setCompanyButton() {
        companyButton.layer.cornerRadius = 4
        companyButton.layer.borderColor = UIColor.brandColor.cgColor
        companyButton.layer.borderWidth = 1
        companyButton.titleLabel?.numberOfLines = 0
        companyButton.titleLabel?.textAlignment = .center
        companyButton.clipsToBounds = true
        companyButton.setTitleColor(.brandColor, for: .normal)
        companyButton.addTarget(self, action: #selector(didTapCompanyButton), for: .touchUpInside)
    }

    fileprivate func setMainStackView() {
        mainStackView.addArrangedSubview(headerView)
        mainStackView.addArrangedSubview(eventDescriptionLabel)
        mainStackView.addArrangedSubview(lecturerHeaderLabel)
        mainStackView.addArrangedSubview(lecturerStackView)
        mainStackView.axis = .vertical  
        mainStackView.spacing = 24
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStackView)
        addSubview(companyButton)
        createConstraints()
    }
    
    fileprivate func createConstraints() {
        companyButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                mainStackView.topAnchor.constraint(equalTo: topAnchor),
                mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .systemPadding),
                mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding),
                mainStackView.widthAnchor.constraint(equalTo: widthAnchor, constant: -padding),
                lecturerImageView.heightAnchor.constraint(equalToConstant: lecturerImageViewHeight),
                lecturerImageView.widthAnchor.constraint(equalToConstant: lecturerImageViewHeight),
                companyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
                companyButton.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: .systemPadding),
                companyButton.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -.systemPadding),
                companyButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                companyButton.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: padding)
            ]
        )
    }

    private func setCompanyButtonSize() {
        guard let titleLabel = companyButton.titleLabel else {
            return
        }
        companyButton.layoutIfNeeded()
        let buttonHeight = max(minCompanyButtonHeight, titleLabel.frame.height + .systemPadding)
        companyButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        companyButton.widthAnchor.constraint(equalToConstant: titleLabel.frame.width + .systemPadding).isActive = true
    }
    
    @objc
    private func didTapCompanyButton() {
        guard let company = viewModel?.company else {
            return
        }
        viewDelegate?.didTapCompanyButton(for: company)
    }
}
