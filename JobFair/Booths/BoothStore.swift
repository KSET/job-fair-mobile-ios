import Foundation
import RxSwift

class BoothStore {

    private let gateway: BoothGateway
    private let disposeBag = DisposeBag()

    init(gateway: BoothGateway = BoothGateway()) {
        self.gateway = gateway
    }

    func showBooths(with presenter: BoothPresenter) {
        gateway.fetchBooths()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe { event in
            switch event {
            case .success(let booths):
                presenter.show(booths: booths)
            case .error:
                presenter.showError()
            }
        }
        .disposed(by: disposeBag)
    }
}
