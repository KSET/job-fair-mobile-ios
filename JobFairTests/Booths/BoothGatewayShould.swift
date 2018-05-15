import Quick
import Nimble
@testable import JobFair

class BoothGatewayShould: QuickSpec {

    override func spec() {
        var sut: BoothGateway!
        var apollo: ApolloMock!

        beforeEach {
            apollo = ApolloMock()
            sut = BoothGateway(apiClient: apollo)
        }

        afterEach {
            apollo = nil
            sut = nil
        }

        describe("getBooths") {
            it("should ask apollo for booths") {
                _ = sut.fetchBooths().subscribe()

                expect(apollo.didFetchQuery) == true
            }

            context("apollo returned error") {
                it("should return error") {
                    apollo.shouldReturnError = true
                    var resultError: Error?

                    _ = sut.fetchBooths().subscribe(onSuccess: nil, onError: { resultError = $0 })

                    expect(resultError).toEventuallyNot(beNil())
                }
            }
        }
    }
}
