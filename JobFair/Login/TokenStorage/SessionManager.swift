import Foundation

class SessionManager {
    
    static let instance = SessionManager()
    
    private let keychainStorage = KeychainStorage()
    
    var user: User?

    var userRole: UserRole? {
        return user?.role
    }
    
    var accessToken: String? {
        return keychainStorage.getCredentials()?.accessToken
    }
    
    func saveCredentials(_ credentials: Credentials) {
        keychainStorage.store(credentials: credentials)
    }
    
    func deleteCredentials() {
        keychainStorage.deleteCredentials()
        user = nil
        SessionManager.setup()
    }
    
    static func setup() {
        NetworkClient.shared.addAuthorizationHeader(with: instance.accessToken)
    }
}
