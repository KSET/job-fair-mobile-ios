import Foundation

class KeychainStorage {
    
    private let keychainServiceName = "hr.app.675"
    
    private var keychainQuery: [String: AnyObject] {
        var query = [String: AnyObject]()
        query[kSecClass as String] = kSecClassGenericPassword
        query[kSecAttrService as String] = keychainServiceName as AnyObject?
        return query
    }
    
    public func store(credentials: Credentials) {
        let credentialData = NSKeyedArchiver.archivedData(withRootObject: credentials)
        
        if getCredentials() != nil {
            updateExistingCredentials(credentialData: credentialData)
        } else {
            saveNewCredentials(credentialData: credentialData)
        }
    }
    
    public func getCredentials() -> Credentials? {
        var query = keychainQuery
        query[kSecMatchLimit as String] = kSecMatchLimitOne
        query[kSecReturnAttributes as String] = kCFBooleanTrue
        query[kSecReturnData as String] = kCFBooleanTrue
        
        var queryResult: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer(&queryResult))
        
        guard status == noErr,
            let existingItem = queryResult as? [String: AnyObject],
            let queryData = existingItem[kSecValueData as String] as? Data else {
                return nil
        }
        
        return NSKeyedUnarchiver.unarchiveObject(with: queryData) as? Credentials
    }
    
    public func deleteCredentials() {
        SecItemDelete(keychainQuery as CFDictionary)
    }
    
    private func updateExistingCredentials(credentialData: Data) {
        var attributesToUpdate = [String: AnyObject]()
        attributesToUpdate[kSecValueData as String] = credentialData as AnyObject?
        SecItemUpdate(keychainQuery as CFDictionary, attributesToUpdate as CFDictionary)
    }
    
    private func saveNewCredentials(credentialData: Data) {
        var newItem = keychainQuery
        newItem[kSecValueData as String] = credentialData as AnyObject?
        SecItemAdd(newItem as CFDictionary, nil)
    }
}
