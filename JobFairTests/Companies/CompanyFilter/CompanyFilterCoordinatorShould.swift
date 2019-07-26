import Quick
import Nimble
@testable import JobFair

class CompanyFilterCoordinatorShould: QuickSpec {
    
    override func spec() {
        var sut: CompanyFilterCoordinator!
        var viewController: CompanyFilterViewController!
        var useCase: CompanyFilterUseCaseMock!
        
        beforeEach {
            let companyFilterViewControllerDelegate = CompanyListViewController()
            viewController = CompanyFilterViewController(delegate: companyFilterViewControllerDelegate,
                                                         currentIndustryId: "")
            sut = CompanyFilterCoordinator(viewController: viewController)
            useCase = CompanyFilterUseCaseMock()
            sut.useCase = useCase
        }
        
        afterEach {
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
    }
}
