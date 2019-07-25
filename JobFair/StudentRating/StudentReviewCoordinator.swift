import Foundation

class StudentReviewCoordinator {
    
    private let navigationService: BaseNavigationService
    private let presenter: StudentReviewPresenter
    private let useCase = StudentReviewUseCase()
    
    init(viewController: StudentReviewViewController) {
        navigationService = BaseNavigationService(navigationController: viewController.navigationController)
        presenter = StudentReviewPresenter(viewController: viewController)
    }
    
    func didTapSubmitButton(for review: StudentReviewInfo) {
        useCase.submitReview(review, presenter: presenter)
    }
    
    func showErrorAlert() {
        navigationService.showErrorAlert()
    }
}
