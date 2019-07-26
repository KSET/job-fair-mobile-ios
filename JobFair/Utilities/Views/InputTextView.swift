import UIKit

class InputTextView: UITextView {
    
    let textViewPlaceholder = Constants.Common.textViewPlaceholder
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        delegate = self
        autocorrectionType = .no
        font = .titleRegular
        textColor = .lightGray
        text = textViewPlaceholder
        textContainerInset = .init(top: .systemPadding, left: .smallPadding, bottom: .systemPadding, right: .smallPadding)
        addBorder()
        addCornerRadius()
    }
}

extension InputTextView: UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        textView.textColor = .brandColor
        if textView.text == textViewPlaceholder {
            textView.text = ""
        }
        
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard textView.text == "" else {
            return
        }
        
        textView.text = textViewPlaceholder
        textView.textColor = .lightGray
    }
}
