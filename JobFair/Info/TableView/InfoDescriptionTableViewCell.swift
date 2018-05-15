import UIKit

class InfoDescriptionTableViewCell: UITableViewCell {
    var viewModel: InfoViewModel? {
        didSet {
            configure()
        }
    }
    
    private let locationImageView = UIImageView()
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
        setupLocationImageViewConstraints()
    }
    
    private func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: .systemPadding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .systemPadding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding)
        ])
    }
    
    private func setupDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .systemPadding),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.systemPadding)
        ])
    }
    
    private func setupLocationImageViewConstraints() {
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(locationImageView)
        NSLayoutConstraint.activate([
            locationImageView.centerYAnchor.constraint(equalTo: descriptionLabel.centerYAnchor),
            locationImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding)
        ])
    }
    
    private func configure() {
        setDescriptionLabel(with: viewModel?.description)
        selectionStyle = .none
        setTitleLabel()
        setLocationImageView()
    }
    
    private func setTitleLabel() {
        titleLabel.text = viewModel?.name
        titleLabel.font = .titleMedium
    }
    
    private func setDescriptionLabel(with description: String?) {
        descriptionLabel.text = description
        descriptionLabel.setLineSpacing(lineSpacing: 5)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .titleRegular
        descriptionLabel.textColor = .darkGray
    }
    
    private func setLocationImageView() {
        locationImageView.image = viewModel!.isSelectable ? #imageLiteral(resourceName: "location") : nil
    }
}
