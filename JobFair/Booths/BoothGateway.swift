import Foundation
import RxSwift

class BoothGateway {

    private let apiClient: APIClient

    init(apiClient: APIClient = NetworkClient.shared.apollo) {
        self.apiClient = apiClient
    }

    func fetchBooths() -> Single<[Booth]> {
        return Single<[Booth]>.create { [unowned self] single -> Disposable in
            self.apiClient.fetch(query: BoothsQuery()) { (result, error) in
                if let error = error {
                    single(.error(error))
                } else if let queryBooths = result?.data?.booths {
                    let booths = queryBooths.compactMap { Booth(queryBooth: $0) }
                    single(.success(booths))
                }
            }

            return Disposables.create()
        }
    }
}
