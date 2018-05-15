import UIKit

enum CellType {
    case company
    case social
}

class LogoAndNameCollectionViewCell: UICollectionViewCell {
    private let nameLabelPadding: CGFloat = 8
    private let logoImageView = UIImageView()
    private let nameLabel = UILabel()
    private let socialLogoHeight: CGFloat = 24
    private let companyLogoHeightMultiplier: CGFloat = 0.7
    private var cellType: CellType?
    private var stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with name: String, logoImage: UIImage?, logoImageUrl: URL?, cellType: CellType?) {
        self.cellType = cellType
        backgroundColor = .white
        setStackView(with: name, logoImage: logoImage, logoImageUrl: logoImageUrl)
    }
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .systemPadding),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding)
        ])
    }
    
    private func setStackView(with name: String, logoImage: UIImage?, logoImageUrl: URL?) {
        setLogoImageView(with: logoImage, logoImageUrl: logoImageUrl)
        setNameLabel(with: name)
        
        stackView.addArrangedSubview(logoImageView)
        stackView.addArrangedSubview(nameLabel)
        
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.axis = .vertical
        
        let logoHeightConstraint = cellType == .company
            ? logoImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: companyLogoHeightMultiplier)
            : logoImageView.heightAnchor.constraint(equalToConstant: socialLogoHeight)
        
        logoHeightConstraint.isActive = true
    }
    
    private func setLogoImageView(with logoImage: UIImage?, logoImageUrl: URL?) {
        if let logoImage = logoImage {
            logoImageView.image = logoImage
        } else {
            logoImageView.kf.setImage(with: logoImageUrl, placeholder: #imageLiteral(resourceName: "placeholder"))
        }
        logoImageView.contentMode = .scaleAspectFit
    }
    
    private func setNameLabel(with name: String) {
        nameLabel.text = name
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.font = .titleRegular
        nameLabel.adjustsFontSizeToFitWidth = true
    }
}
