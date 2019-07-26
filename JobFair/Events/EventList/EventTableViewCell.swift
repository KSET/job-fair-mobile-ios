import UIKit
import Kingfisher

protocol CalendarButtonDelegate: class {
    func didTapCalendarButton(for event: EventViewModel)
}

class EventTableViewCell: UITableViewCell {

    private let logoImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let calendarButton = UIButton()
    private let logoImageViewSize = CGSize(width: 86, height: 108)
    private let progressIndicatorSize = CGSize(width: 16, height: 16)
    private let padding: CGFloat = 8
    
    private let stackView = UIStackView()
    private let eventView = UIView()
    private let progressIndicatorView = UIImageView()

    weak var delegate: CalendarButtonDelegate?

    var viewModel: EventViewModel? {
        didSet {
            updateViews()
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        setStackView()
        setProgressIndicatorView()
        setEventView()
        setImageView()
        setTitleLabel()
        setDateLabel()
        setCalendarButton()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        eventView.addShadow()
    }

    @objc
    private func didTapCalendarButton() {
        guard let viewModel = viewModel else {
            return
        }
        delegate?.didTapCalendarButton(for: viewModel)
    }
    
    private func setStackView() {
        stackView.addArrangedSubview(progressIndicatorView)
        stackView.addArrangedSubview(eventView)
        contentView.addSubview(stackView)
        stackView.pinAllEdges(to: contentView, insets: .init(top: 6, left: 12, bottom: 6, right: 16))
        stackView.spacing = 12
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
    }
    
    private func setProgressIndicatorView() {
        progressIndicatorView.backgroundColor = .white
        progressIndicatorView.contentMode = .center
        progressIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
            progressIndicatorView.widthAnchor.constraint(equalToConstant: progressIndicatorSize.width),
            progressIndicatorView.heightAnchor.constraint(equalToConstant: progressIndicatorSize.height)
            ]
        )
    }

    private func setEventView() {
        eventView.backgroundColor = .white
        eventView.addBorder()
        eventView.addCornerRadius()
    }
    
    private func setImageView() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        eventView.addSubview(logoImageView)

        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: logoImageViewSize.width),
            logoImageView.heightAnchor.constraint(equalToConstant: logoImageViewSize.height),
            logoImageView.leadingAnchor.constraint(equalTo: eventView.leadingAnchor, constant: 8),
            logoImageView.topAnchor.constraint(equalTo: eventView.topAnchor, constant: 8),
            logoImageView.bottomAnchor.constraint(equalTo: eventView.bottomAnchor, constant: -8)
            ])
        logoImageView.layer.cornerRadius = 4
        logoImageView.clipsToBounds = true
        logoImageView.contentMode = .scaleAspectFit
    }

    private func setTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        eventView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: eventView.topAnchor, constant: .systemPadding),
            titleLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: .systemPadding)
            ])

        titleLabel.textColor = .darkGray
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 3
        titleLabel.font = .cellTitleMedium
    }

    private func setDateLabel() {
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        eventView.addSubview(subtitleLabel)

        NSLayoutConstraint.activate(
            [
            subtitleLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: .systemPadding),
            subtitleLabel.trailingAnchor.constraint(equalTo: eventView.trailingAnchor, constant: -.systemPadding),
            subtitleLabel.bottomAnchor.constraint(equalTo: eventView.bottomAnchor, constant: -.systemPadding)
            ]
        )

        subtitleLabel.textColor = UIColor.lightGray
        subtitleLabel.textAlignment = .left
        subtitleLabel.font = .contentLight
    }

    private func setCalendarButton() {
        eventView.addSubview(calendarButton)
        calendarButton.translatesAutoresizingMaskIntoConstraints = false
        calendarButton.imageEdgeInsets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        calendarButton.setImage(#imageLiteral(resourceName: "calendar"), for: .normal)
        calendarButton.imageView?.contentMode = .scaleAspectFit
        calendarButton.addTarget(self, action: #selector(didTapCalendarButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            calendarButton.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            calendarButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: .systemPadding),
            calendarButton.trailingAnchor.constraint(equalTo: eventView.trailingAnchor, constant: -.systemPadding),
            calendarButton.widthAnchor.constraint(equalToConstant: 44),
            calendarButton.heightAnchor.constraint(equalToConstant: 44)
            ])
    }
    
    private func updateViews() {
        guard let viewModel = viewModel else {
            return
        }
        
        titleLabel.text = viewModel.title
        subtitleLabel.text = "\(viewModel.location) | \(viewModel.startTimeString)"
        let logoImageUrl = viewModel.lecturerImageUrl ?? viewModel.company.logoUrl
        logoImageView.kf.setImage(with: logoImageUrl, placeholder: viewModel.placeholderImage)
        calendarButton.isHidden = viewModel.shouldHideCalendarButton
        progressIndicatorView.image = viewModel.progressIndicatorImage
        let borderColor = viewModel.isInProgress ? UIColor.brandColor : UIColor.lightGray
        eventView.layer.borderColor = borderColor.cgColor
    }
}
