import Foundation
import RxSwift
import Apollo

class AssistanceGateway {
    
    func submitAssistanceRequest(with text: String?) -> Single<Void> {
       let assistanceItem = OnsiteRequestItemInput(id: nil, requestType: .assistance, amount: nil, note: text)
       let onSiteRequestInput = OnsiteRequestInput(clientMutationId: "onsite_request", companyId: SessionManager.instance.user?.companyId, note: nil, items: [assistanceItem])
        
        return Single<Void>.create(subscribe: { single -> Disposable in
            NetworkClient.shared.apollo.perform(mutation: OnSiteRequestMutation(input: onSiteRequestInput)) { (result, error) in
                if let error = error {
                    single(.error(error))
                } else if result?.data?.onsiteRequest?.data != nil {
                    single(.success(()))
                } else {
                    single(.error(OnSiteRequestError.noData))
                }
            }
            
            return Disposables.create()
        })
    }
}
