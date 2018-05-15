import UIKit
import Kingfisher

protocol CalendarButtonDelegate: class {
    func didTapCalendarButton(for event: EventViewModel)
}

class EventTableViewCell: UITableViewCell {

    private let logoImageView = UIImageView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let calendarButton = UIButton(frame: .init(x: 0, y: 0, width: 44, height: 44))
    private let logoImageViewSize = CGSize(width: 80, height: 80)
    private let padding: CGFloat = 8

    weak var delegate: CalendarButtonDelegate?

    var viewModel: EventViewModel? {
        didSet {
            titleLabel.text = viewModel?.title
            dateLabel.text = viewModel?.startDateString
            let logoImageUrl = viewModel?.lecturerImageUrl ?? viewModel?.company.logoUrl
            logoImageView.kf.setImage(with: logoImageUrl, placeholder: viewModel?.placeholderImage)
            calendarButton.isHidden = viewModel?.shouldHideCalendarButton ?? true
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setImageView()
        setTitleLabel()
        setDateLabel()
        setCalendarButton()
        selectionStyle = .none
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    private func didTapCalendarButton() {
        guard let viewModel = viewModel else {
            return
        }
        delegate?.didTapCalendarButton(for: viewModel)
    }

    private func setImageView() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logoImageView)

        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: logoImageViewSize.width),
            logoImageView.heightAnchor.constraint(equalToConstant: logoImageViewSize.height),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .systemPadding),
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: .systemPadding),
            logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.systemPadding)
            ])
        logoImageView.layer.cornerRadius = 4
        logoImageView.clipsToBounds = true
        logoImageView.contentMode = .scaleAspectFit
    }

    private func setTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: .systemPadding),
            titleLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: .systemPadding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(.systemPadding + calendarButton.frame.width))
            ])

        titleLabel.textColor = .darkGray
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 3
        titleLabel.font = .titleRegular
    }

    private func setDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateLabel)

        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: .systemPadding),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.systemPadding)
            ])

        dateLabel.textColor = UIColor.lightGray
        dateLabel.textAlignment = .left
        dateLabel.font = .contentLight
    }

    private func setCalendarButton() {
        calendarButton.imageEdgeInsets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        calendarButton.setImage(#imageLiteral(resourceName: "calendar"), for: .normal)
        calendarButton.imageView?.contentMode = .scaleAspectFit
        accessoryView = calendarButton
        calendarButton.addTarget(self, action: #selector(didTapCalendarButton), for: .touchUpInside)
    }
}
