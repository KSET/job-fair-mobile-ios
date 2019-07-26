import Foundation

struct InfoViewModel {
    let name: String
    let description: NSAttributedString?
    let isSelectable: Bool
    let socialNetworks: [SocialNetworkViewModel]?
}
