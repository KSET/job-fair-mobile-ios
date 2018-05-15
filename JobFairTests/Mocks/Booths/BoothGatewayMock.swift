import Foundation
import RxSwift
@testable import JobFair

class BoothGatewayMock: BoothGateway {
    var didReturnBooths = false
    var shouldShowError = false

    override func fetchBooths() -> Single<[Booth]> {
        if shouldShowError {
            return Single.error(TestErrors.fakeError)
        }
        didReturnBooths = true
        let booth = Booth(id: "id", latitude: 45, longitude: 16, company: Company.testInstance)

        return Single.just([booth])
    }
}
