import Foundation
import RxSwift
import Apollo

protocol APIClient {
    @discardableResult func fetch<Query: GraphQLQuery>(query: Query, resultHandler: OperationResultHandler<Query>?) -> Cancellable
}

extension ApolloClient: APIClient {
    
    func fetch<Query>(query: Query, resultHandler: ((GraphQLResult<Query.Data>?, Error?) -> Void)?) -> Cancellable where Query: GraphQLQuery {
        return fetch(query: query, cachePolicy: .returnCacheDataElseFetch, queue: DispatchQueue.main, resultHandler: resultHandler)
    }
}

class EventGateway {
    
    let apiClient: APIClient

    init(apiClient: APIClient = NetworkClient.shared.apollo) {
        self.apiClient = apiClient
    }
    
    func fetchPresentations() -> Single<[Presentation]> {
        return Single<[Presentation]>.create { [unowned self] single -> Disposable in
            self.apiClient.fetch(query: PresentationsQuery()) { (result, error) in
                if let error = error {
                    single(.error(error))
                } else if let queryPresentations = result?.data?.presentations {
                    let presentations = queryPresentations.compactMap { Presentation(queryPresentation: $0) }
                    single(.success(presentations))
                }
            }
            
            return Disposables.create()
        }
    }
    
    func fetchWorkshops() -> Single<[Workshop]> {
        return Single<[Workshop]>.create { [unowned self] single -> Disposable in
            self.apiClient.fetch(query: WorkshopsQuery()) { (result, error) in
                if let error = error {
                    single(.error(error))
                } else if let queryWorkshops = result?.data?.workshops {
                    let workshops = queryWorkshops.compactMap { Workshop(queryWorkshop: $0) }
                    single(.success(workshops))
                }
            }
            
            return Disposables.create()
        }
    }
}
