import UIKit

protocol CompanyDetailsStackViewDelegate: class {
    func didSelectWebsiteAction()
    func didSelectBoothLocationAction()
}

class CompanyDetailsStackView: UIStackView {
    weak var companyDetailsStackViewDelegate: CompanyDetailsStackViewDelegate!
    var viewModel: CompanyViewModel? {
        didSet {
            setupUI()
        }
    }
    
    private let bottomPadding: CGFloat = 24
    private let logoWidthMaxMultiplier: CGFloat = 0.8
    private let logoWidthMinMultiplier: CGFloat = 0.3
    private var websiteAndBoothStackView = UIStackView()
    private var nameLabel = UILabel()
    private var logoWidthConstraint: NSLayoutConstraint!
    private var logoImageView = UIImageView()
    
    func animate(with axis: UILayoutConstraintAxis) {
        animateStackViews(with: axis)
        animateLogoWidth(with: axis)
    }
    
    private func animateStackViews(with axis: UILayoutConstraintAxis) {
        self.axis = axis
        websiteAndBoothStackView.axis = axis == .horizontal ? .vertical : .horizontal
        nameLabel.textAlignment = axis == .horizontal ? .left : .center
    }
    
    private func animateLogoWidth(with axis: UILayoutConstraintAxis) {
        logoWidthConstraint.isActive = false
        let multiplier: CGFloat = axis == .horizontal ? logoWidthMinMultiplier : logoWidthMaxMultiplier
        logoWidthConstraint = logoImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: multiplier)
        logoWidthConstraint.isActive = true
    }
    
    private func setupUI() {
        setLogoImageView()
        let infoStackView = createInfoStackView()
        
        addArrangedSubview(logoImageView)
        addArrangedSubview(infoStackView)
        axis = .vertical
        spacing = 8
        alignment = .center
        layoutMargins = UIEdgeInsets(top: .systemPadding, left: .systemPadding, bottom: bottomPadding, right: .systemPadding)
        isLayoutMarginsRelativeArrangement = true
        
        logoWidthConstraint = logoImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: logoWidthMaxMultiplier)
        logoWidthConstraint.isActive = true
    }
    
    private func setLogoImageView() {
        logoImageView.kf.setImage(with: viewModel?.logoUrl, placeholder: #imageLiteral(resourceName: "placeholder"))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.setContentCompressionResistancePriority(.required, for: .vertical)
        logoImageView.setContentHuggingPriority(.required, for: .vertical)
    }
    
    private func setNameLabel() {
        nameLabel.text = viewModel?.name
        nameLabel.numberOfLines = 3
        nameLabel.textAlignment = .center
        nameLabel.font = .titleBold
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.textColor = .brandColor
        nameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    private func createInfoStackView() -> UIStackView {
        setNameLabel()
        setWebsiteAndBoothStackView()
        
        let infoStackView = UIStackView(arrangedSubviews: [nameLabel, websiteAndBoothStackView])
        infoStackView.axis = .vertical
        infoStackView.distribution = .fillProportionally
        infoStackView.spacing = 20
        infoStackView.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        infoStackView.isLayoutMarginsRelativeArrangement = true
        
        return infoStackView
    }
    
    private func setWebsiteAndBoothStackView() {
        let websiteIconedLabel = createIconedLabel(with: "Go to website", image: #imageLiteral(resourceName: "web"), and: #selector(didTapWebsiteStackView))
        websiteAndBoothStackView.addArrangedSubview(websiteIconedLabel)
        
        if let boothLocation = viewModel?.boothLocation, !boothLocation.isEmpty {
            let boothIconedLabel = createIconedLabel(with: boothLocation, image: #imageLiteral(resourceName: "location"), and: #selector(didTapBoothLocationStackView))
            boothIconedLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 252), for: .horizontal)
            websiteAndBoothStackView.addArrangedSubview(boothIconedLabel)
        }
        
        websiteAndBoothStackView.distribution = .fillProportionally
        websiteAndBoothStackView.spacing = 20
        websiteAndBoothStackView.isLayoutMarginsRelativeArrangement = true
    }
    
    private func createIconedLabel(with text: String, image: UIImage, and selector: Selector) -> IconedLabel {
        let iconedLabel = IconedLabel()
        iconedLabel.imageView.image = image
        iconedLabel.textLabel.text = text
        let tapRecongnizer = UITapGestureRecognizer(target: self, action: selector)
        iconedLabel.addGestureRecognizer(tapRecongnizer)
        return iconedLabel
    }
    
    @objc private func didTapBoothLocationStackView() {
        companyDetailsStackViewDelegate.didSelectBoothLocationAction()
    }
    
    @objc private func didTapWebsiteStackView() {
        companyDetailsStackViewDelegate.didSelectWebsiteAction()
    }
}
