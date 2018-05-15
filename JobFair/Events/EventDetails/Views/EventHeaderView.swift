import UIKit
import Kingfisher

class EventHeaderView: UIView {

    private let imageView: UIImageView = UIImageView()
    private let imageViewSize = CGSize(width: 80, height: 80)
    private let titleLabel: UILabel = UILabel()
    private let stackView: UIStackView = UIStackView()

    private let dateIconedLabel = IconedLabel()
    private let locationIconedLabel = IconedLabel()

    private let calendarButton: UIButton = UIButton(type: .custom)
    private let calendarButtonSize = CGSize(width: 30, height: 30)

    weak var delegate: CalendarButtonDelegate?

    var viewModel: EventViewModel? {
        didSet {
            imageView.kf.setImage(with: viewModel?.company.logoUrl, placeholder: #imageLiteral(resourceName: "placeholder"))
            titleLabel.text = viewModel?.title
            dateIconedLabel.textLabel.text = viewModel?.startToEndDateString
            locationIconedLabel.textLabel.text = viewModel?.location
            calendarButton.isHidden = viewModel?.shouldHideCalendarButton ?? true
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
        setImageView()
        setTitleLabel()
        setTopStackView()
        setCalendarButton()
        setDateIconedLabel()
        setLocationIconedLabel()
    }

    private func setImageView() {
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = false
    }

    private func setTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.font = .titleLarge
    }

    private func setTopStackView() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.spacing = .systemPadding
        stackView.alignment = .center
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                stackView.topAnchor.constraint(equalTo: topAnchor, constant: .systemPadding),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .systemPadding),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding),
                imageView.heightAnchor.constraint(equalToConstant: imageViewSize.height),
                imageView.widthAnchor.constraint(equalToConstant: imageViewSize.width)
            ]
        )
    }

    private func setDateIconedLabel() {
        addSubview(dateIconedLabel)
        dateIconedLabel.imageView.image = #imageLiteral(resourceName: "time")
        dateIconedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                dateIconedLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: .systemPadding),
                dateIconedLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                dateIconedLabel.bottomAnchor.constraint(equalTo: calendarButton.centerYAnchor, constant: -8),
                dateIconedLabel.trailingAnchor.constraint(lessThanOrEqualTo: calendarButton.leadingAnchor, constant: -.systemPadding)
            ]
        )
    }

    private func setLocationIconedLabel() {
        addSubview(locationIconedLabel)
        locationIconedLabel.imageView.image = #imageLiteral(resourceName: "location")
        locationIconedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                locationIconedLabel.topAnchor.constraint(equalTo: dateIconedLabel.bottomAnchor, constant: .systemPadding),
                locationIconedLabel.leadingAnchor.constraint(equalTo: dateIconedLabel.leadingAnchor),
                locationIconedLabel.trailingAnchor.constraint(lessThanOrEqualTo: calendarButton.leadingAnchor, constant: -.systemPadding),
                locationIconedLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        )
    }

    private func setCalendarButton() {
        addSubview(calendarButton)
        calendarButton.setImage(#imageLiteral(resourceName: "calendar"), for: .normal)
        calendarButton.translatesAutoresizingMaskIntoConstraints = false
        calendarButton.imageView?.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate(
            [
                calendarButton.heightAnchor.constraint(equalToConstant: calendarButtonSize.height),
                calendarButton.widthAnchor.constraint(equalToConstant: calendarButtonSize.width),
                calendarButton.trailingAnchor.constraint(equalTo: trailingAnchor)
            ]
        )
        
        calendarButton.addTarget(self, action: #selector(didTapCalendarButton), for: .touchUpInside)
    }
    
    @objc
    private func didTapCalendarButton() {
        guard let viewModel = viewModel else {
            return
        }
        delegate?.didTapCalendarButton(for: viewModel)
    }
}
