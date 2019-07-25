import Foundation

class TabBarCoordinator {
    
    private let navigationService: TabBarNavigationService
    
    init(tabBarViewController: TabBarViewController) {
        navigationService = TabBarNavigationService(tabBarViewController: tabBarViewController)
    }
    
    func didTapFabButton(buttonId: String) {
        switch buttonId {
        case Constants.Menu.ButtonId.scanQRCode:
            navigationService.showBarcodeScannerViewController()
        case Constants.Menu.ButtonId.assistance:
            navigationService.presentAssistanceViewController()
        case Constants.Menu.ButtonId.drinks:
            navigationService.presentDrinksViewController()
        case Constants.Menu.ButtonId.submitCV:
            navigationService.presentSubmitCVWebView()
        default:
            return
        }
    }
}
