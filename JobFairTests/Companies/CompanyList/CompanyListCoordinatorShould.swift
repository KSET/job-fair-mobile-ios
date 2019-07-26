import Quick
import Nimble
@testable import JobFair

class CompanyListCoordinatorShould: QuickSpec {
    
    override func spec() {
        var sut: CompanyListCoordinator!
        var navigationService: CompaniesNavigationServiceMock!
        var store: CompanyStoreMock!
        
        beforeEach {
            let navigationController = UINavigationController()
            navigationService = CompaniesNavigationServiceMock(navigationController: navigationController)
            let viewController = CompanyListViewController()
            store = CompanyStoreMock()
            sut = CompanyListCoordinator(viewController: viewController, navigationController: navigationController, store: store)
            sut.navigationService = navigationService
            sut.store = store
        }
        
        afterEach {
            navigationService = nil
            sut = nil
            store = nil
        }

        
        describe("didSelectCompany(_ companies: [CompanyViewModel], index: Int)") {
            it("should tell navigation service to open CompanyDetails") {
                sut.didSelectCompany([], index: 0)
                expect(navigationService.didNavigateToCompanyDetails) == true
            }
        }
        
        describe("viewDidLoad(industryId: String)") {
            it("should tell store to fetch companies") {
                sut.viewDidLoad(industryId: "")
                expect(store.didFetchCompanies) == true
            }
        }

        describe("didGetError") {
            it("should tell navigation service to show error alert") {
                sut.didGetError(for: "fakeIndustryId")

                expect(navigationService.didShowErrorAlert) == true
            }
        }
    }
}
