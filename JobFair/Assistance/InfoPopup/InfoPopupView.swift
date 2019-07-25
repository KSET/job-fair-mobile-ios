import UIKit

class InfoPopupView: UIView {
    
    var viewModel: InfoPopupViewModel? {
        didSet {
            imageView.image = viewModel?.image
            titleLabel.text = viewModel?.title
            subtitleLabel.text = viewModel?.subtitle
            infoLabel.attributedText = viewModel?.info
        }
    }
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let infoLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupImageView()
        setupTitleLabel()
        setupSubtitleLabel()
        setupInfoLabel()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                imageView.topAnchor.constraint(equalTo: topAnchor, constant: 128),
                imageView.widthAnchor.constraint(equalToConstant: 50),
                imageView.heightAnchor.constraint(equalToConstant: 50),
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48)
            ]
        )
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.font = .titleMedium
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48)
            ]
        )
    }
    
    private func setupSubtitleLabel() {
        addSubview(subtitleLabel)
        subtitleLabel.font = .cellTitleMedium
        subtitleLabel.textColor = .secondaryColor
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 37),
                subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48)
            ]
        )
    }
    
    private func setupInfoLabel() {
        addSubview(infoLabel)
        infoLabel.font = .titleRegular
        infoLabel.textColor = .black
        infoLabel.numberOfLines = 0
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                infoLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
                infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48)
            ]
        )
    }
}
