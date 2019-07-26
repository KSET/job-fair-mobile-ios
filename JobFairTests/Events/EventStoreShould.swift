import Quick
import Nimble
import RxSwift
@testable import JobFair

class EventStoreShould: QuickSpec {

    override func spec() {
        var sut: EventStore!
        var gateway: EventGatewayMock!
        var presenter: EventPresenterMock!

        beforeEach {
            presenter = EventPresenterMock()
            gateway = EventGatewayMock()
            sut = EventStore(gateway: gateway)
        }

        afterEach {
            sut = nil
            gateway = nil
            presenter = nil
        }

        describe("showPresentations(with presenter)") {
            it("should get presentations from gateway and sort them by day") {
                sut.showPresentations(with: presenter)

                expect(gateway.didReturnPresentations).toEventually(beTrue())
                expect(presenter.events?.firstDayEvents as? [Presentation]).toEventually(equal(gateway.firstDayPresentations))
                expect(presenter.events?.secondDayEvents as? [Presentation]).toEventually(equal(gateway.secondDayPresentations))
            }

            context("error occurs while getting presentations from gateway") {
                it("should tell presenter to show error") {
                    gateway.shouldShowError = true

                    sut.showPresentations(with: presenter)

                    expect(presenter.didShowError).toEventually(beTrue())
                }
            }

            context("gateway successfully return presentations") {
                it("should tell presenter to show presentations") {
                    sut.showPresentations(with: presenter)

                    expect(presenter.didShowEvents).toEventually(beTrue())
                }
            }
        }

        describe("showWorkshops(with presenter)") {
            it("should get workshops from gateway") {
                sut.showWorkshops(with: presenter)

                expect(gateway.didReturnWorkshops).toEventually(beTrue())
                expect(presenter.events?.firstDayEvents as? [Workshop]).toEventually(equal(gateway.firstDayWorkshops))
                expect(presenter.events?.secondDayEvents as? [Workshop]).toEventually(equal(gateway.secondDayWorkshops))
            }

            context("error occurs while getting presentations from gateway") {
                it("should tell presenter to show error") {
                    gateway.shouldShowError = true

                    sut.showWorkshops(with: presenter)

                    expect(presenter.didShowError).toEventually(beTrue())
                }
            }

            context("gateway successfully return presentations") {
                it("should tell presenter to show presentations") {
                    sut.showWorkshops(with: presenter)

                    expect(presenter.didShowEvents).toEventually(beTrue())
                }
            }
        }
    }
}
