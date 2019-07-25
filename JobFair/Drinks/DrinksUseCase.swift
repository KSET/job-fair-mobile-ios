import Foundation
import RxSwift

class DrinksUseCase {
    private let gateway: DrinksGateway
    private let disposeBag = DisposeBag()
    
    init(gateway: DrinksGateway = DrinksGateway()) {
        self.gateway = gateway
    }
    
    func submitDrinkRequest(with amountMap: [String: Int], presenter: DrinksPresenter) {
        presenter.showLoadingViewController()
        
        gateway.submitDrinkRequest(with: amountMap)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { result in
                presenter.hideLoadingViewController()
                presenter.showSuccessAlert(with: amountMap)
            }, onError: { error in
                presenter.hideLoadingViewController()
                presenter.showErrorAlert()
            })
            .disposed(by: disposeBag)
    }
}
