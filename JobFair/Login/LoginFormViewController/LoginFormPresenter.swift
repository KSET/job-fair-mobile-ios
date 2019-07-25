import Foundation

class LoginFormPresenter {
    
    private unowned let viewController: LoginFormViewController
    
    init(viewController: LoginFormViewController) {
        self.viewController = viewController
    }
    
    func showLoadingViewController() {
        viewController.navigationController?.showSmallLoadingViewController()
    }
    
    func finishLogin() {
        viewController.hideLoadingViewController()
        viewController.delegate?.didFinishLogin()
    }
    
    func finishResetPassword() {
        viewController.navigationController?.hideLoadingViewController { [weak self] in
            self?.viewController.navigationController?.popViewController(animated: true)
        }
    }
    
    func showInputError() {
        viewController.showInputError()
    }
    
    func showNetworkError() {
        viewController.showNetworkError()
    }
}
