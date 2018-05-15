import Quick
import Nimble
@testable import JobFair

class CompanyViewModelShould: QuickSpec {

    override func spec() {
        describe("init(company: Company)") {
            it("should create event view model from company") {
                let company = Company.testInstance
                let viewModel = CompanyViewModel(company: company)
                
                let expectedWorkshopTime = SharedDateFormatter.shared.presentableString(from: company.workshopDate!)
                let expectedPresentationTime = SharedDateFormatter.shared.presentableString(from: company.presentationDate!)
                
                
                expect(viewModel.id) == "id"
                expect(viewModel.name) == "name"
                expect(viewModel.industry) == Industry(id: "id", name: "name")
                expect(viewModel.logoUrl?.absoluteString) == "www.webimage.com"
                expect(viewModel.description) == "description"
                expect(viewModel.cocktailName) == "cocktail"
                expect(viewModel.websiteUrlString) == "www.web.com"
                expect(viewModel.presentationTime) == expectedPresentationTime
                expect(viewModel.workshopTime) == expectedWorkshopTime
                expect(viewModel.presentationName) == "presentationName"
                expect(viewModel.workshopName) == "workshopName"
            }
        }
    }
}
