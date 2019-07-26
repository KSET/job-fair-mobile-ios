import UIKit
import SnapKit

extension UIView {
    
    func addCornerRadius() {
        layer.cornerRadius = 12
    }
    
    func addBorder() {
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.borderColor.cgColor
    }
    
    func addShadow() {
        layer.shadowColor = UIColor.shadowColor.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.masksToBounds = false
    }
        
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    static func shadowView(with subview: UIView) -> UIView {
        let shadowView = UIView()
        shadowView.backgroundColor = .clear
        shadowView.addShadow()
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
        shadowView.addSubview(subview)
        subview.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        return shadowView
    }
}
