import UIKit
import RxSwift
import RxCocoa

protocol InfoSocialTableViewCellDelegate: class {
    func didSelectSocialNetworkWithLink(_ url: URL)
}

class InfoSocialTableViewCell: UITableViewCell {
    
    weak var infoSocialTableViewCellDelegate: InfoSocialTableViewCellDelegate!
    
    var viewModel: InfoViewModel? {
        didSet {
            configure()
        }
    }
    
    private let titleLabel = UILabel()
    private let stackView = UIStackView()
    private let disposeBag = DisposeBag()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        setupTitleLabelConstraints()
        setupStackContainer()
        setupStackView()
    }
    
    private func setupStackContainer() {
        let containerView = UIView()
        containerView.backgroundColor = .white
        addSubview(containerView)
        containerView.addSubview(stackView)
        stackView.pinAllEdges(to: containerView,
                              insets: .init(top: .systemPadding, left: .systemPadding, bottom: .systemPadding, right: .systemPadding))
        addBorder(to: containerView)
        addShadow(to: containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .systemPadding),
                containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .systemPadding),
                containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding),
                containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.systemPadding)
            ]
        )
    }
    
    private func addBorder(to view: UIView) {
        view.addCornerRadius()
        view.addBorder()
    }
    
    private func addShadow(to view: UIView) {
        view.addShadow()
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    private func setupStackView() {
        stackView.spacing = 24
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
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
    
    private func configure() {
        setTitleLabel()
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        viewModel?.socialNetworks?.forEach { [weak self] socialNetwork in
            self?.createButton(for: socialNetwork)
        }
    }
    
    private func createButton(for socialNetwok: SocialNetworkViewModel) {
        let button = UIButton()
        button.setImage(socialNetwok.image.withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .brandColor
        stackView.addArrangedSubview(button)
        button.rx.tap.bind { [weak self] _ in
            self?.infoSocialTableViewCellDelegate.didSelectSocialNetworkWithLink(socialNetwok.url)
        }
        .disposed(by: disposeBag)
    }
    
    private func setTitleLabel() {
        titleLabel.text = viewModel?.name
        titleLabel.font = .headerTitle
        titleLabel.textColor = .secondaryColor
    }
}
