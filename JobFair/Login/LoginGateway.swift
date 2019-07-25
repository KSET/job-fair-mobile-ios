import Foundation
import RxSwift
import Apollo

enum LoginError: Error {
    case noUser
}

class LoginGateway {
    
    func login(email: String, password: String) -> Single<Credentials> {
        let loginInput = LoginInput(clientMutationId: "login", email: email, password: password)
        return Single<Credentials>.create(subscribe: { single -> Disposable in
            NetworkClient.shared.apollo.perform(mutation: LoginQueryMutation(input: loginInput)) { (result, error) in
                if let error = error {
                    single(.error(error))
                } else if let loginPayload = result?.data?.login,
                        let user = loginPayload.user {
                    let credentials = Credentials(loginPayload: loginPayload)
                    let user = User(user)
                    SessionManager.instance.user = user
                    NetworkClient.shared.addAuthorizationHeader(with: credentials.accessToken)
                    single(.success(credentials))
                } else {
                    single(.error(LoginError.noUser))
                }
            }

            return Disposables.create()
        })
    }
    
    func currentUser() -> Single<User> {
        return Single<User>.create(subscribe: { single -> Disposable in
            _ = NetworkClient.shared.apollo.fetch(query: CurrentUserQuery()) { (result, error) in
                if let error = error {
                    single(.error(error))
                } else if let currentUserPayload = result?.data?.currentUser {
                    let user = User(currentUserPayload)
                    SessionManager.instance.user = user
                    single(.success(user))
                } else {
                    single(.error(LoginError.noUser))
                }
            }

            return Disposables.create()
        })
    }
    
    func resetPassword(for email: String) -> Single<Void> {
        let input = ResetPasswordInput(clientMutationId: nil, email: email)
        return Single<Void>.create(subscribe: { single -> Disposable in
            NetworkClient.shared.apollo.perform(mutation: ResetPasswordMutation(input: input)) { (result, error) in
                if let error = error {
                    single(.error(error))
                } else if result?.data?.resetPassword?.success == true {
                    single(.success(()))
                } else {
                    single(.error(LoginError.noUser))
                }
            }
            
            return Disposables.create()
        })
    }
}
