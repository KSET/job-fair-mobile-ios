import Foundation
import UIKit

class NewsListPresenter {
    unowned let viewController: NewsListViewController
    
    init(viewController: NewsListViewController) {
        self.viewController = viewController
    }
    
    func show(newsList: [News]) {
        let viewModels = newsList.compactMap { NewsViewModel(news: $0) }
        viewController.show(news: viewModels)
    }
    
    func showError() {
        viewController.showError()
    }
}
