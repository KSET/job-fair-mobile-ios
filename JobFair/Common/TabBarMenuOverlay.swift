import UIKit

class TabBarMenuOverlay: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        alpha = 0
        backgroundColor = UIColor.brandColor.withAlphaComponent(0.8)
        let overlayWidth = frame.width + 32
        let yPoint = frame.height - (overlayWidth / 2)
        let circleView = UIView(frame: .init(x: -16, y: yPoint, width: overlayWidth, height: overlayWidth))
        circleView.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        circleView.layer.cornerRadius = circleView.frame.width / 2
        addSubview(circleView)
    }
}
