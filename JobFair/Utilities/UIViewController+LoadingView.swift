import UIKit

extension UIViewController {

    func showLoadingView() {
        let loadingView = LoadingView()
        view.addSubview(loadingView)
        loadingView.pinAllEdges(to: view)
    }

    func removeLoadingView() {
        let loadingView = view.subviews.first { $0 is LoadingView }
        loadingView?.removeFromSuperview()
    }
}
