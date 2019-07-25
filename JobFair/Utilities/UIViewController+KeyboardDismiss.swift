import UIKit

extension UIViewController {
    
    func addKeyboardDismissRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
