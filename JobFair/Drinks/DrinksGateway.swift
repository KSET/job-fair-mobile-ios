import Foundation
import RxSwift
import Apollo

class DrinksGateway {
    
    func submitDrinkRequest(with amountMap: [String: Int]) -> Single<OnSiteRequestResult> {
        let items = amountMap.map { (pair) -> OnsiteRequestItemInput in
            let (title, amount) = pair
            return OnsiteRequestItemInput(id: nil, requestType: OnsiteRequestType(rawValue: title.lowercased()), amount: amount, note: nil)
        }
        let onSiteRequestInput = OnsiteRequestInput(clientMutationId: "onsite_request", companyId: SessionManager.instance.user?.companyId, note: nil, items: items)
        
        return Single<OnSiteRequestResult>.create(subscribe: { single -> Disposable in
            NetworkClient.shared.apollo.perform(mutation: OnSiteRequestMutation(input: onSiteRequestInput)) { (result, error) in
                if let error = error {
                    single(.error(error))
                } else if let payload = result?.data?.onsiteRequest?.data, let result = OnSiteRequestResult(payloadResult: payload) {
                    single(.success(result))
                } else {
                    single(.error(OnSiteRequestError.noData))
                }
            }
            
            return Disposables.create()
        })
    }
}
