import UIKit

extension UINavigationController {
    
    func setDefaultNavigationBarAppearance() {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = false
        view.backgroundColor = nil
        navigationBar.tintColor = .black
        navigationBar.barTintColor = .white
        UIBarButtonItem.appearance().setTitleTextAttributes([.font: UIFont.cellTitleMedium],
                                    for: .normal)
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black,
                                             .font: UIFont.titleMedium]
    }
    
    func setClearNavigationBar() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = UIColor.clear
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.tintColor = .brandColor
    }
}
