import Quick
import Nimble
@testable import JobFair

class IndustryViewModelShould: QuickSpec {
    
    override func spec() {
        describe("industry: Industry") {
            it("should create industry view model from industry") {
                let industry = Industry(id: "1", name: "Test industry")
                
                let viewModel = IndustryViewModel(industry: industry)
                
                expect(viewModel.id) == "1"
                expect(viewModel.name) == "Test industry"
            }
        }
    }
}
