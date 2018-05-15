import Quick
import Nimble
@testable import JobFair

class MapCoordinatorShould: QuickSpec {

    override func spec() {
        var sut: MapCoordinator!
        var navigationService: CompaniesNavigationServiceMock!
        var boothStore: BoothStoreMock!

        beforeEach {
            boothStore = BoothStoreMock()
            navigationService = CompaniesNavigationServiceMock(navigationController: nil)
            sut = MapCoordinator(viewController: MapViewControllerMock())
            sut.boothStore = boothStore
            sut.navigationService = navigationService
        }

        afterEach {
            navigationService = nil
            boothStore = nil
            sut = nil
        }

        describe("viewDidLoad") {
            it("should tell booth store to show botts") {
                sut.viewDidLoad()

                expect(boothStore.didShowBooths) == true
            }
        }

        describe("didTapOnCompanyMarker(with:)") {
            it("should tell booth store to show company detail view controller") {
                sut.didTapOnCompanyMarker(with: CompanyViewModel.testInstance)

                expect(navigationService.didShowCompanyDetail) == true
            }
        }

        describe("didGetError") {
            it("should tell navigation service to show error alert") {
                sut.didGetError()

                expect(navigationService.didShowErrorAlert) == true
            }
        }
    }
}
