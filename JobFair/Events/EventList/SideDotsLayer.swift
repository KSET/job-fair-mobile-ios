import UIKit

class SideDotsLayer: CAReplicatorLayer {
    
    init(frame: CGRect) {
        super.init()
        self.frame = frame
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        zPosition = -1
        masksToBounds = false
        
        let image = UIImage(named: "list_dot")!
        let imageLayer = CALayer()
        imageLayer.contents = image.cgImage
        imageLayer.frame.size = image.size
        addSublayer(imageLayer)
        
        let instanceOffset = image.size.height * 2
        let instanceCount = frame.height / instanceOffset
        instanceTransform = CATransform3DMakeTranslation(0, instanceOffset, 0)
        self.instanceCount = Int(floor(instanceCount))
    }

}
