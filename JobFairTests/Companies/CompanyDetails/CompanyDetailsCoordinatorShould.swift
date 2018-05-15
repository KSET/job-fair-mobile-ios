import Quick
import Nimble
@testable import JobFair

class CompanyDetailsCoordinatorShould: QuickSpec {

    override func spec() {
        var sut: CompanyDetailsCoordinator!
        var navigationService: CompaniesNavigationServiceMock!

        beforeEach {
            navigationService = CompaniesNavigationServiceMock(navigationController: nil)
            sut = CompanyDetailsCoordinator(navigationController: nil)
            sut.navigationService = navigationService
        }

        afterEach {
            navigationService = nil
            sut = nil
        }

        describe("didSelectOpenURLAction(websiteUrlString)") {
            it("should tell navigation service to open url") {
                sut.didSelectOpenURLAction(websiteUrlString: "https://www.facebook.com/JobFair.FER/")

                expect(navigationService.didOpenURL) == true
            }
        }

        describe("didTapBoothLocationButton(companyId)") {
            it("should tell navigation screen to show map with higlighted company") {
                sut.didTapBoothLocationButton(companyId: "companyId")

                expect(navigationService.didShowMapViewController) == true
            }
        }
    }
}
