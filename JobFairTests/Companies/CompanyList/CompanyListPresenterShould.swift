import Quick
import Nimble
@testable import JobFair

class CompanyListPresenterShould: QuickSpec {
    
    override func spec() {
        var sut: CompanyListPresenter!
        var viewController: CompanyListViewControllerMock!
        
        beforeEach {
            viewController = CompanyListViewControllerMock()
            sut = CompanyListPresenter(viewController: viewController)
        }
        
        afterEach {
            viewController = nil
            sut = nil
        }
        
        describe("showCompanies(_ companies: [Company]?, industryId: String)") {
            it("should set viewController currentCompanies property") {
                sut.showCompanies([], industryId: "")
                expect(viewController.didSetCompanies) == true
            }
        }

        describe("showError()") {
            it("should tell view controller to show error") {
                sut.showError()

                expect(viewController.didShowError) == true
            }
        }
    }
}
