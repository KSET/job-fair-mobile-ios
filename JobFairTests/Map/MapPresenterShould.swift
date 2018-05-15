import Quick
import Nimble
import CoreLocation
@testable import JobFair

class MapPresenterShould: QuickSpec {

    override func spec() {
        var sut: MapPresenter!
        var viewController: MapViewControllerMock!

        beforeEach {
            viewController = MapViewControllerMock()
            sut = MapPresenter(viewController: viewController)
        }

        afterEach {
            viewController = nil
            sut = nil
        }

        describe("showError()") {
            it("should tell view controller to show error") {
                sut.showError()

                expect(viewController.didShowError) == true
            }
        }

        describe("show(events)") {
            it("should tell view controller to show booths") {
                let booth = Booth(id: "432", latitude: 43, longitude: 65, company: Company.testInstance)
                sut.show(booths: [booth])

                expect(viewController.didShowBooths) == true
                expect(viewController.didShowError) == false
            }
        }
    }
}
