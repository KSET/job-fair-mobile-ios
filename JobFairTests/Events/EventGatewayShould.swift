import Quick
import Nimble
@testable import JobFair

class EventGatewayShould: QuickSpec {

    override func spec() {
        Nimble.AsyncDefaults.Timeout = 3
        Nimble.AsyncDefaults.PollInterval = 0.1
        
        var sut: EventGateway!
        var apollo: ApolloMock!

        beforeEach {
            apollo = ApolloMock()
            sut = EventGateway(apiClient: apollo)
        }

        afterEach {
            apollo = ApolloMock()
            sut = nil
        }

        describe("getPresentations") {
            it("should ask apollo for presentations") {
                _ = sut.fetchPresentations().subscribe()

                expect(apollo.didFetchQuery) == true
            }

            context("apollo returned error") {
                it("should return error") {
                    apollo.shouldReturnError = true
                    var resultError: Error?

                    _ = sut.fetchPresentations().subscribe(onSuccess: nil, onError: { resultError = $0 })

                    expect(resultError).toEventuallyNot(beNil())
                }
            }
        }

        describe("getWorkshops") {
            it("should ask apollo for workshops") {
                _ = sut.fetchWorkshops().subscribe()

                expect(apollo.didFetchQuery) == true
            }

            context("apollo returned error") {
                it("should return error") {
                    apollo.shouldReturnError = true
                    var resultError: Error?

                    _ = sut.fetchWorkshops().subscribe(onSuccess: nil, onError: { resultError = $0 })

                    expect(resultError).toEventuallyNot(beNil())
                }
            }
        }
    }
}
