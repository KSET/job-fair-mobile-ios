import Foundation
import RxSwift

class CompanyFilterUseCase {
    private let companyGateway: CompanyGateway
    private let disposeBag = DisposeBag()
    
    init(gateway: CompanyGateway = CompanyGateway()) {
        self.companyGateway = gateway
    }
    
    func fetchIndustries(presenter: CompanyFilterPresenter) {
        presenter.showLoadingView()
        companyGateway.fetchIndustries()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { industries in
            presenter.showIndustries(industries)
            presenter.removeLoadingView()
        }, onError: { _ in
            presenter.showError()
            presenter.removeLoadingView()
        })
        .disposed(by: disposeBag)
    }
}
