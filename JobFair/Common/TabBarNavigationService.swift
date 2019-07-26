import UIKit
import SafariServices
import BarcodeScanner

class TabBarNavigationService {

    private let tabBarViewController: TabBarViewController
    private lazy var barcodeController = BarcodeController()
    
    init(tabBarViewController: TabBarViewController) {
        self.tabBarViewController = tabBarViewController
    }
    
    func presentDrinksViewController() {
        let drinksViewController = DrinksViewController()
        drinksViewController.delegate = self
        let viewController = BaseNavigationController(rootViewController: drinksViewController)
        tabBarViewController.present(viewController, animated: true, completion: nil)
    }
    
    func presentAssistanceViewController() {
        let assistanceViewController = AssistanceViewController()
        assistanceViewController.delegate = self
        let vc = BaseNavigationController(rootViewController: assistanceViewController)
        tabBarViewController.present(vc, animated: true, completion: nil)
    }

    func presentSubmitCVWebView() {
        var urlString = Config.URLs.submitCV
        if let accessToken = SessionManager.instance.accessToken {
            urlString += "?auth_token=\(accessToken)"
        }
        
        let safariViewController = SFSafariViewController(url: URL(string: urlString)!)
        tabBarViewController.present(safariViewController, animated: true, completion: nil)
    }
    
    func showBarcodeScannerViewController() {
        let viewController = BarcodeScannerViewController()
        viewController.messageViewController.messages.processingText = Constants.StudentReview.processingText
        viewController.codeDelegate = barcodeController
        viewController.errorDelegate = barcodeController
        viewController.dismissalDelegate = barcodeController
        barcodeController.delegate = self
        tabBarViewController.present(viewController, animated: true, completion: nil)
    }
}

extension TabBarNavigationService: DismissDelegate {
    
    @objc func didTapCloseButton() {
        tabBarViewController.dismiss(animated: true, completion: nil)
    }
}
