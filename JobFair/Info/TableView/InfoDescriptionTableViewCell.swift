import UIKit

class InfoDescriptionTableViewCell: UITableViewCell {
    var viewModel: InfoViewModel? {
        didSet {
            configure()
        }
    }
    
    private let locationLabel = UILabel()
    private var descriptionLabel = UILabel()
    private var titleLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        setupTitleLabelConstraints()
        setupDescriptionLabelConstraints()
        setupLocationLabelConstraints()
    }
    
    private func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: .systemPadding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding)
        ])
    }
    
    private func setupDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .smallPadding),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.systemPadding)
        ])
    }
    
    private func setupLocationLabelConstraints() {
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(locationLabel)
        NSLayoutConstraint.activate([
            locationLabel.centerYAnchor.constraint(equalTo: descriptionLabel.centerYAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding),
            locationLabel.widthAnchor.constraint(equalToConstant: 64),
            locationLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func configure() {
        setDescriptionLabel(with: viewModel?.description)
        selectionStyle = .none
        setTitleLabel()
        setLocationButton()
    }
    
    private func setTitleLabel() {
        titleLabel.text = viewModel?.name
        titleLabel.font = .headerTitle
        titleLabel.textColor = .secondaryColor
    }
    
    private func setDescriptionLabel(with description: NSAttributedString?) {
        descriptionLabel.font = .titleRegular
        descriptionLabel.textColor = .black
        descriptionLabel.attributedText = description
        descriptionLabel.setLineSpacing(lineSpacing: 5)
        descriptionLabel.numberOfLines = 0
    }
    
    private func setLocationButton() {
        locationLabel.backgroundColor = .brandColor
        locationLabel.addCornerRadius()
        locationLabel.textColor = .white
        locationLabel.font = .cellTitleMedium
        locationLabel.text = Constants.Social.mapsButtonTitle
        locationLabel.clipsToBounds = true
        locationLabel.textAlignment = .center
        locationLabel.isHidden = !viewModel!.isSelectable
    }
}
