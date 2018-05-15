import Quick
import Nimble
@testable import JobFair

class BoothViewModelShould: QuickSpec {

    override func spec() {

        describe("init(event)") {
            it("should create booth view model from booth") {
                let booth = Booth(id: "321",
                                  latitude: 45,
                                  longitude: 16,
                                  company: Company.testInstance)

                let viewModel = BoothViewModel(booth: booth)

                expect(viewModel.geolocation.latitude) == booth.latitude
                expect(viewModel.geolocation.longitude) == booth.longitude
                expect(viewModel.company.name) == booth.company.name
                expect(viewModel.company.logoUrl?.absoluteString) == booth.company.logoUrlString
            }
        }
    }
}
