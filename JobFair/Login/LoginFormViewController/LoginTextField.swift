import Foundation
import SkyFloatingLabelTextField

class LoginTextField: SkyFloatingLabelTextField {
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.y += 8
        return rect
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        tintColor = .brandColor
        font = .titleRegular
        autocapitalizationType = .none
        titleFont = .contentLight
        textColor = .black
        lineColor = .lightContentColor
        lineHeight = 0.5
        selectedLineHeight = 0.5
        selectedTitleColor = .lightContentColor
        titleColor = .lightContentColor
        autocorrectionType = .no
        titleFormatter = { $0 }
        textErrorColor = .black
    }
}
