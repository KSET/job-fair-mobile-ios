import UIKit

class LogoAndNameCollectionViewCell: UICollectionViewCell {
    
    let containerView = UIView()
    private let logoImageView = UIImageView()
    private let nameLabel = UILabel()
    private let separatorView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with name: String, logoImageUrl: URL?) {
        logoImageView.kf.setImage(with: logoImageUrl, placeholder: #imageLiteral(resourceName: "placeholder"))
        nameLabel.text = name
    }
    
    private func commonInit() {
        backgroundColor = .white
        contentView.backgroundColor = .white
        setupContainerView()
        setupNameLabel()
        setupSeparatorView()
        setupLogoImageView()
    }
    
    private func setupContainerView() {
        contentView.addSubview(containerView)
        containerView.pinAllEdges(to: self)
        contentView.addBorder()
        contentView.addShadow()
        contentView.addCornerRadius()
    }
    
    private func setupNameLabel() {
        containerView.addSubview(nameLabel)
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 0
        nameLabel.font = .cellTitleMedium
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .systemPadding),
                nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -.systemPadding),
                nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: .smallPadding)
            ]
        )
    }
    
    private func setupSeparatorView() {
        addSubview(separatorView)
        separatorView.backgroundColor = .borderColor
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                separatorView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: .smallPadding),
                separatorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                separatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                separatorView.heightAnchor.constraint(equalToConstant: 0.5)
            ]
        )
    }
    
    private func setupLogoImageView() {
        addSubview(logoImageView)
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                logoImageView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: .systemPadding),
                logoImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .systemPadding),
                logoImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -.systemPadding),
                logoImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -.systemPadding)
            ]
        )
    }
}
