import UIKit

class CompanyDetailsTableViewCell: UITableViewCell {
    private var titleLabel = UILabel()
    private var descriptionLabel = UILabel()
    private let padding: CGFloat = 8
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with title: String, and description: String) {
        setTitleLabel(with: title)
        setDescriptionLabel(with: description)
        selectionStyle = .none
    }
    
    private func setupConstraints() {
        setupTitleLabelConstraints()
        setupDescriptionLabelConstraints()
    }
    
    private func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding * 2),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ])
    }
    
    private func setupDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])
    }
    
    private func setTitleLabel(with title: String) {
        titleLabel.text = title
        titleLabel.font = .titleMedium
    }
    
    private func setDescriptionLabel(with description: String) {
        descriptionLabel.text = description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .darkGray
    }
}
