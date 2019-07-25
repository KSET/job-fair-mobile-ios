import UIKit
import SafariServices

class BaseNavigationService: NSObject {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func showErrorAlert(retryCompletion: (() -> Void)? = nil) {
        let actionTitle = retryCompletion == nil ? Constants.ErrorAlertController.okTitle : Constants.ErrorAlertController.retryTitle
        let alertViewController = UIAlertController(title: Constants.ErrorAlertController.title,
                                                    message: Constants.ErrorAlertController.message, preferredStyle: .alert)
        let retryAction = UIAlertAction(title: actionTitle, style: .default) { _ in
            retryCompletion?()
        }
        alertViewController.addAction(retryAction)
        navigationController?.present(alertViewController, animated: true, completion: nil)
    }
    
    func open(_ url: URL) {
        guard !url.absoluteString.contains("mailto") else {
            UIApplication.shared.openURL(url)
            return
        }
        let safariViewController = SFSafariViewController(url: url)
        navigationController?.present(safariViewController, animated: true)
    }
    
    func dismiss() {
        navigationController?.dismiss(animated: true)
    }
}
