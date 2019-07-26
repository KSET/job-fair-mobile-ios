import Quick
import Nimble
import RxSwift
@testable import JobFair

class CompanyFilterUseCaseShould: QuickSpec {
    
    override func spec() {
        var sut: CompanyFilterUseCase!
        var presenter: CompanyFilterPresenterMock!
        var gateway: CompanyGatewayMock!
        var viewController: CompanyFilterViewController!
        
        beforeEach {
            gateway = CompanyGatewayMock()
            sut = CompanyFilterUseCase(gateway: gateway)
            let companyFilterViewControllerDelegate = CompanyListViewController()
            viewController = CompanyFilterViewController(delegate: companyFilterViewControllerDelegate,
                                                         currentIndustryId: "1")
            presenter = CompanyFilterPresenterMock(viewController: viewController)
        }
        
        afterEach {
            sut = nil
            presenter = nil
            gateway = nil
            viewController = nil
        }
        
        describe("fetchIndustries(presenter: CompanyFilterPresenter)") {
            it("should tell presenter to show industries") {
                sut.fetchIndustries(presenter: presenter)
                expect(gateway.didGetIndustries) == true
                expect(presenter.didShowIndustries).toEventually(beTrue())
            }
        }
    }
}
