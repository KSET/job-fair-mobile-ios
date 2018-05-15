import UIKit

extension UIViewController {
    
    func setDefaultNavigationBarAppearance() {
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.view.backgroundColor = nil
        navigationController?.navigationBar.backgroundColor = nil
    }
    
    func setTranslucentNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = UIColor.clear
        navigationController?.navigationBar.backgroundColor = UIColor.clear
    }
    
    func removeBackButtonTitle() {
        let barButton = UIBarButtonItem()
        barButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = barButton
    }
}
