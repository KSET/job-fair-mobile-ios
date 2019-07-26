import Quick
import Nimble
@testable import JobFair

class CompanyFilterPresenterShould: QuickSpec {

    override func spec() {
        var sut: CompanyFilterPresenter!
        var viewController: CompanyFilterViewControllerMock!

        beforeEach {
            let companyFilterViewControllerDelegate = CompanyListViewController()
            viewController = CompanyFilterViewControllerMock(delegate: companyFilterViewControllerDelegate,
                                                             currentIndustryId: Constants.Common.defaultId)
            sut = CompanyFilterPresenter(viewController: viewController)
        }

        afterEach {
            viewController = nil
            sut = nil
        }

        describe("showIndustries(_ industries: [Industry])") {
            it("should set viewController industries property") {
                sut.showIndustries([])
                expect(viewController.didSetIndustries) == true
            }
        }

        describe("showError()") {
            it("shoul tell view controller to show error") {
                sut.showError()

                expect(viewController.didShowError) == true
            }
        }
    }
}
