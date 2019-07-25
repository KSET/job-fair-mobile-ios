import Foundation

class InfoCoordinator {
    
    var presenter: InfoPresenter
    var navigationService: InfoNavigationService
    
    init(viewController: InfoViewController) {
        presenter = InfoPresenter(viewController: viewController)
        navigationService = InfoNavigationService(navigationController: viewController.navigationController)
    }
    
    func viewDidLoad() {
        presenter.showInfo()
    }
    
    func didSelectOpenURLAction(_ url: URL) {
        navigationService.open(url)
    }
    
    func didSelectShareAction() {
        navigationService.shareWebsite()
    }
    
    func didSelectUndabotWebsiteAction() {
        navigationService.openUndabotWebsite()
    }
    
    func didSelectGoogleMapsAction() {
        navigationService.openGoogleMaps()
    }
    
    func didSelectDayOneStreamAction() {
        navigationService.openDayOneStream()
    }
    
    func didSelectDayTwoStreamAction() {
        navigationService.openDayTwoStream()
    }
}
