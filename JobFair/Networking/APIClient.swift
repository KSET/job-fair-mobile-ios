import Foundation
import Apollo

class NetworkClient {

    static let shared = NetworkClient()
    let apollo: ApolloClient

    private init() {
        apollo = ApolloClient(url: Config.URLs.apiBase)
    }
}
