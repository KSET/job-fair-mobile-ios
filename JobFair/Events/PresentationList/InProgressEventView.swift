import UIKit
import Kingfisher

class InProgressEventView: UIView {
    
    private let imageView = UIImageView()
    private let imageViewSize = CGSize(width: 100, height: 100)
    
    private let titleLabel = UILabel()
    private let inProgressLabel = UIButton()
    
    var viewModel: EventViewModel? {
        didSet {
            titleLabel.text = viewModel?.title
            let logoImageUrl = viewModel?.lecturerImageUrl ?? viewModel?.company.logoUrl
            imageView.kf.setImage(with: logoImageUrl, placeholder: #imageLiteral(resourceName: "placeholder"))
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
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        setImageView()
        setTitleLabel()
        setInProgressLabel()
    }
    
    private func setImageView() {
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 4
        NSLayoutConstraint.activate(
            [
                imageView.heightAnchor.constraint(equalToConstant: imageViewSize.height),
                imageView.widthAnchor.constraint(equalToConstant: imageViewSize.width),
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .systemPadding),
                imageView.topAnchor.constraint(equalTo: topAnchor, constant: .systemPadding),
                imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.systemPadding)
            ]
        )
    }
    
    private func setTitleLabel() {
        addSubview(titleLabel)
        titleLabel.numberOfLines = 2
        titleLabel.font = .titleLarge
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 24),
                titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -.systemPadding)
            ]
        )
    }
    
    private func setInProgressLabel() {
        addSubview(inProgressLabel)
        inProgressLabel.layer.cornerRadius = 4
        inProgressLabel.setTitle(Constants.Common.inProgress, for: .normal)
        inProgressLabel.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        inProgressLabel.isUserInteractionEnabled = false
        inProgressLabel.contentEdgeInsets = UIEdgeInsets(top: 4, left: 5, bottom: 4, right: 5)
        inProgressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                inProgressLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                inProgressLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
                inProgressLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -.systemPadding)
            ]
        )
    }
}
