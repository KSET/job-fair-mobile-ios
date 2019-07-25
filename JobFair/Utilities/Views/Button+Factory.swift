import UIKit

extension UIButton {
    
    static var primaryButton: UIButton {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .titleMedium
        button.setBackgroundImage(UIImage.from(color: UIColor.brandColor), for: .normal)
        button.setBackgroundImage(UIImage.from(color: UIColor.brandColor.withAlphaComponent(0.7)), for: .disabled)
        button.addCornerRadius()
        button.layer.masksToBounds = true
        return button
    }
    
    static var secondaryButton: UIButton {
        let button = UIButton()
        button.setTitleColor(.brandColor, for: .normal)
        button.titleLabel?.font = .titleMedium
        button.backgroundColor = .white
        button.addCornerRadius()
        return button
    }
    
    static var actionButton: UIButton {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.addCornerRadius()
        button.addBorder()
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = .titleBold
        button.setBackgroundImage(UIImage.from(color: .white), for: .normal)
        button.setBackgroundImage(UIImage.from(color: .disabledButtonBackgroundColor), for: .disabled)
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        
        return button
    }
}
