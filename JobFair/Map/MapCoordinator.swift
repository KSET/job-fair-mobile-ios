import Foundation

class MapCoordinator {

    var boothStore = BoothStore()
    var navigationService: CompanyNavigationService
    private let presenter: MapPresenter

    init(viewController: MapViewController) {
        presenter = MapPresenter(viewController: viewController)
        navigationService = CompanyNavigationService(navigationController: viewController.navigationController)
    }

    func viewDidLoad() {
        boothStore.showBooths(with: presenter)
    }

    func didTapOnCompanyMarker(with company: CompanyViewModel) {
        navigationService.showCompanyDetailsViewController(for: company)
    }

    func didGetError() {
        navigationService.showErrorAlert { [weak self] in
            self?.viewDidLoad()
        }
    }
}
