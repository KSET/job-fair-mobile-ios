import Quick
import Nimble
@testable import JobFair

class InfoPresenterShould: QuickSpec {

    override func spec() {
        var sut: InfoPresenter!
        var viewController: InfoViewControllerMock!
        
        beforeEach {
            viewController = InfoViewControllerMock()
            sut = InfoPresenter(viewController: viewController)
        }
        
        afterEach {
            viewController = nil
            sut = nil
        }
        
        describe("showInfo()") {
            it("should set viewController's info") {
                sut.showInfo()
                expect(viewController.didSetInfo) == true
            }
        }
    }
}
