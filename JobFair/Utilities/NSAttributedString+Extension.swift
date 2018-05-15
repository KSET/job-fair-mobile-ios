import Foundation
import UIKit

extension NSAttributedString {
    
    func height(withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = boundingRect(with: constraintSize, options: .usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.height)
    }
    
    convenience init(htmlString html: String, font: UIFont) throws {
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        let data = html.data(using: .utf8, allowLossyConversion: true)
        let fontFamily = font.familyName
        guard (data != nil),
            let attributedString = try? NSMutableAttributedString(data: data!, options: options, documentAttributes: nil)
            else {
                try self.init(data: data ?? Data(html.utf8), options: options, documentAttributes: nil)
                return
        }
        
        let fontSize: CGFloat? = font.pointSize
        let range = NSRange(location: 0, length: attributedString.length)
        attributedString.enumerateAttribute(.font, in: range, options: .longestEffectiveRangeNotRequired) { attribute, range, _ in
            if let htmlFont = attribute as? UIFont {
                let traits = htmlFont.fontDescriptor.symbolicTraits
                var descriptor = htmlFont.fontDescriptor.withFamily(fontFamily)
                
                if (traits.rawValue & UIFontDescriptorSymbolicTraits.traitBold.rawValue) != 0 {
                    descriptor = descriptor.withSymbolicTraits(.traitBold)!
                }
                
                if (traits.rawValue & UIFontDescriptorSymbolicTraits.traitItalic.rawValue) != 0 {
                    descriptor = descriptor.withSymbolicTraits(.traitItalic)!
                }
                attributedString.addAttribute(.foregroundColor, value: UIColor.darkGray, range: range)
                attributedString.addAttribute(.font, value: UIFont(descriptor: descriptor, size: fontSize ?? htmlFont.pointSize), range: range)
            }
        }
        
        self.init(attributedString: attributedString)
    }
}
