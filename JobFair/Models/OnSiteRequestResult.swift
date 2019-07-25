import Foundation

enum OnSiteRequestError: Error {
    case noData
}

struct OnSiteRequestResultItem {
    let id: String
    let amount: Int
}

struct OnSiteRequestResult {
    let id: String
    let items: [OnSiteRequestResultItem]
}

extension OnSiteRequestResult {
    
    init?(payloadResult: OnSiteRequestMutation.Data.OnsiteRequest.Datum?) {
        guard let id = payloadResult?.id, let items = payloadResult?.items else {
            return nil
        }
        self.id = id
        self.items = items.compactMap({ (payloadItem) -> OnSiteRequestResultItem? in
            guard let id = payloadItem?.id, let amount = payloadItem?.amount else {
                return nil
            }
            return OnSiteRequestResultItem(id: id, amount: amount)
        })
    }
}
