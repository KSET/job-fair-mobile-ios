import Foundation

class Credentials: NSObject, NSCoding {
    let accessToken: String
    
    struct Keys {
        static let accessToken = "accessToken"
    }
    
    init(accessToken: String) {
        self.accessToken = accessToken
    }

    // swiftlint:disable force_cast
    public required init?(coder aDecoder: NSCoder) {
        self.accessToken = aDecoder.decodeObject(forKey: Keys.accessToken) as! String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(accessToken, forKey: Keys.accessToken)
    }
}

extension Credentials {
    
    convenience init(loginPayload: LoginQueryMutation.Data.Login) {
        self.init(accessToken: loginPayload.token ?? "")
    }
}
