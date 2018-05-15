import Quick
import Nimble
import RxSwift
@testable import JobFair

class CompanyStoreShould: QuickSpec {

    override func spec() {
        var sut: CompanyStore!
        var presenter: CompanyListPresenterMock!
        var gateway: CompanyGatewayMock!
        var viewController: CompanyListViewController!
        
        beforeEach {
            gateway = CompanyGatewayMock()
            sut = CompanyStore(gateway: gateway)
            viewController = CompanyListViewController()
            presenter = CompanyListPresenterMock(viewController: viewController)
        }
        
        afterEach {
            sut = nil
            presenter = nil
            gateway = nil
            viewController = nil
        }
        
        describe("getFilteredCompanies(for industryId: String, _ companies: [Company])") {
            it("should return filtered companies") {
                let allCompanies = [
                    Company(id: "1", name: "", industry: Industry(id: "1", name: ""), logoUrlString: "", description: "",
                            workshopDate: nil, workshopName: nil, presentationDate: nil, presentationName: nil, cocktailName: "", websiteUrlString: "", boothLocation: ""),
                    Company(id: "2", name: "", industry: Industry(id: "2", name: ""), logoUrlString: "", description: "",
                           workshopDate: nil, workshopName: nil, presentationDate: nil, presentationName: nil, cocktailName: "", websiteUrlString: "", boothLocation: ""),
                    Company(id: "3", name: "", industry: Industry(id: "3", name: ""), logoUrlString: "", description: "",
                            workshopDate: nil, workshopName: nil, presentationDate: nil, presentationName: nil, cocktailName: "", websiteUrlString: "", boothLocation: ""),
                ]
                
                let filteredCompany = sut.getFilteredCompanies(for: "1", allCompanies).first
                expect(filteredCompany?.id) == "1"
            }
        }
        
        describe("fetchCompanies(for industryId: String, presenter: CompanyListPresenter)") {
            it("should tell presenter to show companies") {
                sut.showCompanies(for: "", presenter: presenter)
                expect(gateway.didGetCompanies) == true
                expect(presenter.didShowCompanies).toEventually(beTrue())
            }
        }
    }
}
