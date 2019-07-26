import Foundation

class StudentReviewPresenter {
    
    private unowned let viewController: StudentReviewViewController
    
    init(viewController: StudentReviewViewController) {
        self.viewController = viewController
    }
    
    func showErrorAlert() {
        viewController.showErrorAlert()
    }
    
    func hideLoadingViewController() {
        viewController.hideLoadingViewController()
    }
    
    func showLoadingViewController() {
        viewController.navigationController?.showSmallLoadingViewController()
    }
    
    func dismissViewController() {
        viewController.delegate?.didTapCloseButton()
    }
}
