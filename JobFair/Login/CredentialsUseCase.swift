import Foundation
import RxSwift

class CredentialsUseCase {
    
    private let loginGateway = LoginGateway()
    private let disposeBag = DisposeBag()
    
    func login(email: String?, password: String?, presenter: LoginFormPresenter) {
        guard let email = email, !email.isEmpty,
            let password = password, !password.isEmpty else {
                presenter.showInputError()
                return
        }
        
        presenter.showLoadingViewController()
        loginGateway.login(email: email, password: password)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { credentials in
                SessionManager.instance.saveCredentials(credentials)
                presenter.finishLogin()
            }, onError: { error in
                presenter.showNetworkError()
            })
            .disposed(by: disposeBag)
    }
    
    func resetPassword(for email: String?, presenter: LoginFormPresenter) {
        guard let email = email, !email.isEmpty else {
                presenter.showInputError()
                return
        }
        
        presenter.showLoadingViewController()
        loginGateway.resetPassword(for: email)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { _ in
                presenter.finishResetPassword()
            }, onError: { error in
                presenter.showNetworkError()
            })
            .disposed(by: disposeBag)
    }
}
