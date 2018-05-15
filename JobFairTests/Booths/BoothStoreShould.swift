import Quick
import Nimble
import RxSwift
@testable import JobFair

class BoothStoreShould: QuickSpec {

    override func spec() {
        var sut: BoothStore!
        var gateway: BoothGatewayMock!
        var presenter: BoothPresenterMock!

        beforeEach {
            gateway = BoothGatewayMock()
            sut = BoothStore(gateway: gateway)
            presenter = BoothPresenterMock()
        }

        afterEach {
            presenter = nil
            gateway = nil
            sut = nil
        }

        describe("showBooths(with presenter)") {
            it("should get booths from gateway") {
                sut.showBooths(with: presenter)

                expect(gateway.didReturnBooths) == true
            }

            context("error occurs while getting booths from gateway") {
                it("should tell presenter to show error") {
                    gateway.shouldShowError = true

                    sut.showBooths(with: presenter)

                    expect(presenter.didShowError).toEventually(beTrue())
                }
            }

            context("gateway successfully return booths") {
                it("should tell presenter to show booths") {
                    sut.showBooths(with: presenter)

                    expect(presenter.didShowBooths).toEventually(beTrue())
                }
            }
        }
    }
}
