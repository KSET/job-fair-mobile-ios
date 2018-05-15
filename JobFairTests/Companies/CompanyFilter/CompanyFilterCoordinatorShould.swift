import Quick
import Nimble
@testable import JobFair

class CompanyFilterCoordinatorShould: QuickSpec {
    
    override func spec() {
        var sut: CompanyFilterCoordinator!
        var navigationService: CompaniesNavigationServiceMock!
        var viewController: CompanyFilterViewController!
        var useCase: CompanyFilterUseCaseMock!
        
        beforeEach {
            let navigationController = UINavigationController()
            navigationService = CompaniesNavigationServiceMock(navigationController: navigationController)
            let companyFilterViewControllerDelegate = CompanyListViewController()
            viewController = CompanyFilterViewController(companyFilterViewControllerDelegate: companyFilterViewControllerDelegate as? CompanyFilterViewControllerDelegate,
                                                         currentIndustryId: "")
            sut = CompanyFilterCoordinator(viewController: viewController, navigationController: navigationController)
            sut.navigationService = navigationService
            useCase = CompanyFilterUseCaseMock()
            sut.useCase = useCase
        }
        
        afterEach {
            navigationService = nil
            viewController = nil
            sut = nil
            useCase = nil
        }
        
        describe("didLoadView()") {
            it("should tell usecase to fetch industries") {
                sut.viewDidLoad()
                expect(useCase.didFetchIndustries) == true
            }
        }
        
        describe("didSelectIndustry(_ industry: Industry)") {
            it("should tell navigation service to dismiss modal") {
                sut.didSelectIndustry()
                expect(navigationService.didDismiss).toEventually(beTrue())
            }
        }
        
        describe("didSelectDismissAction()") {
            it("should tell navigation service to dismiss modal") {
                sut.didSelectDismissAction()
                expect(navigationService.didDismiss) == true
            }
        }

        describe("didGetError()") {
            it("should tell navigation service to show error alert") {
                sut.didGetError()
                
                expect(navigationService.didShowErrorAlert) == true
            }
        }
    }
}
