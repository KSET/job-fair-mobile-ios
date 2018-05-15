import UIKit

extension UINavigationController {
    
    func setDefaultNavigationBarAppearance() {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.shadowImage = nil
        navigationBar.isTranslucent = false
        view.backgroundColor = nil
        navigationBar.backgroundColor = .brandColor
        navigationBar.tintColor = .white
        navigationBar.barTintColor = .brandColor
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UIApplication.shared.statusBarView?.backgroundColor = .brandColor
    }
    
    func setClearNavigationBar() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = UIColor.clear
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.tintColor = .white
    }
}
