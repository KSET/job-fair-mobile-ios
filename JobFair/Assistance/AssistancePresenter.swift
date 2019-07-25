import UIKit

class AssistancePresenter {
    
    private unowned let viewController: AssistanceViewController
    
    init(viewController: AssistanceViewController) {
        self.viewController = viewController
    }
    
    func showErrorAlert() {
        viewController.showErrorAlert()
    }
    
    func showSuccessAlert(for assistanceText: String?) {
        let image = UIImage(named: "assistance_info")
        let subtitle = assistanceText?.isEmpty == true ? "" : Constants.Assistance.infoSubtitle
        let viewModel = InfoPopupViewModel(image: image,
                                           title: Constants.Assistance.infoTitle,
                                           subtitle: subtitle,
                                           info: NSAttributedString(string: assistanceText ?? ""))
        viewController.showInfoPopup(with: viewModel)
    }
    
    func hideLoadingViewController() {
        viewController.navigationController?.hideLoadingViewController()
    }
    
    func showLoadingViewController() {
        viewController.navigationController?.showSmallLoadingViewController()
    }
}
