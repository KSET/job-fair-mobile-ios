import Foundation
import RxSwift

class RootUseCase {
    
    private let gateway: LoginGateway
    private let disposeBag = DisposeBag()
    
    init(gateway: LoginGateway = LoginGateway()) {
        self.gateway = gateway
    }
    
    func fetchCurrentUser(presenter: RootPresenter) {
        gateway.currentUser()
            .subscribe(onSuccess: { user in
                presenter.showTabBarViewController()
            }, onError: { error in
                SessionManager.instance.deleteCredentials()
                presenter.showLoginViewController()
            })
        .disposed(by: disposeBag)
    }
}
