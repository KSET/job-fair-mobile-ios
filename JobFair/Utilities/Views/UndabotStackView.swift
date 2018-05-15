import UIKit

class UndabotStackView: UIStackView {
    private let tapHandler: (() -> Void)?
    
    init(frame: CGRect, tapHandler: (() -> Void)?) {
        self.tapHandler = tapHandler
        super.init(frame: frame)
        
        addArrangedSubview(createLogoImageView())
        addArrangedSubview(createTitleView())
        addOverlayButton()
        
        axis = .vertical
        distribution = .fillEqually
        spacing = 2
        alignment = .center
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createTitleView() -> UILabel {
        let titleLabel = UILabel()
        titleLabel.text = "Developed by Undabot"
        titleLabel.font = .contentLight
        titleLabel.textColor = .gray
        return titleLabel
    }
    
    private func createLogoImageView() -> UIImageView {
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "undabot_logo"))
        logoImageView.contentMode = .scaleAspectFit
        return logoImageView
    }
    
    private func addOverlayButton() {
        let overlayButton = UIButton()
        overlayButton.addTarget(self, action: #selector(didTapOverlayButton), for: .touchUpInside)
        addSubview(overlayButton)
        overlayButton.pinAllEdges(to: self)
    }
    
    @objc private func didTapOverlayButton() {
        tapHandler?()
    }
}
