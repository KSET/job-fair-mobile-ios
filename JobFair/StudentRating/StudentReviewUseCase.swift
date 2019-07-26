import Foundation
import RxSwift

class StudentReviewUseCase {
    
    private let gateway: StudentReviewGateway
    private let disposeBag = DisposeBag()
    
    init(gateway: StudentReviewGateway = StudentReviewGateway()) {
        self.gateway = gateway
    }
    
    func submitReview(_ review: StudentReviewInfo, presenter: StudentReviewPresenter) {
        presenter.showLoadingViewController()
        gateway.submitStudentReview(review)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { result in
                presenter.hideLoadingViewController()
                presenter.dismissViewController()
            }, onError: { error in
                presenter.hideLoadingViewController()
                presenter.showErrorAlert()
            })
            .disposed(by: disposeBag)
    }
}
