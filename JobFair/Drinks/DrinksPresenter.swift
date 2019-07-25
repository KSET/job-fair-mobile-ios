import UIKit

class DrinksPresenter {
    
    private unowned let viewController: DrinksViewController
    
    init(viewController: DrinksViewController) {
        self.viewController = viewController
    }
    
    func showDrinks() {
        let viewModels = Constants.Drinks.drinkTitles.map { title -> DrinkViewModel in
            return DrinkViewModel(image: UIImage(named: title.lowercased())!, title: title)
        }
        viewController.viewModels = viewModels
    }
    
    func showErrorAlert() {
        viewController.showErrorAlert()
    }
    
    func showSuccessAlert(with amountMap: [String: Int]) {
        let info = NSMutableAttributedString()
        amountMap.forEach { item  in
            let itemCount = NSAttributedString(string: "\(item.value) ", attributes: [.font: UIFont.contentBold])
            let itemName = NSAttributedString(string: "\(item.key) \n")
            info.append(itemCount)
            info.append(itemName)
        }
        let infoViewModel = InfoPopupViewModel(image: UIImage(named: "drinks_info"),
                                               title: Constants.Drinks.infoTitle,
                                               subtitle: Constants.Drinks.infoSubtitle,
                                               info: info)
        viewController.showInfoPopup(with: infoViewModel)
    }
    
    func showLoadingViewController() {
        viewController.navigationController?.showSmallLoadingViewController()
    }
    
    func hideLoadingViewController() {
        viewController.navigationController?.hideLoadingViewController()
    }
}
