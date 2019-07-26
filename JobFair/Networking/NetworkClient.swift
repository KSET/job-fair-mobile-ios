import Foundation
import Apollo

class NetworkClient {

    static let shared = NetworkClient()
    var apollo: ApolloClient
    
    private init() {
        apollo = ApolloClient(url: Config.URLs.apiBase)
    }
    
    func addAuthorizationHeader(with token: String?) {
        let configuration = URLSessionConfiguration.default
        
        if let token = token {
            configuration.httpAdditionalHeaders = ["Authorization": "JWT \(token)"]
        }
        
        apollo = ApolloClient(networkTransport: HTTPNetworkTransport(url: Config.URLs.apiBase, configuration: configuration))
    }
}
