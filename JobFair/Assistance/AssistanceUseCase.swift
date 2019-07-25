import Foundation
import RxSwift

class AssistanceUseCase {
    
    private let gateway: AssistanceGateway
    private let disposeBag = DisposeBag()
    
    init(gateway: AssistanceGateway = AssistanceGateway()) {
        self.gateway = gateway
    }
    
    func submitAssitanceRequest(with text: String?, presenter: AssistancePresenter) {
        presenter.showLoadingViewController()
        
        gateway.submitAssistanceRequest(with: text)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { result in
                presenter.hideLoadingViewController()
                presenter.showSuccessAlert(for: text)
            }, onError: { error in
                presenter.hideLoadingViewController()
                presenter.showErrorAlert()
            })
            .disposed(by: disposeBag)
        
    }
}
