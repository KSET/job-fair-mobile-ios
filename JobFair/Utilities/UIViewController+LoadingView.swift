import UIKit

extension UIViewController {

    func showLoadingView() {
        let loadingView = LoadingView()
        view.addSubview(loadingView)
        loadingView.pinAllEdges(to: view)
    }

    func removeLoadingView() {
        let loadingView = view.subviews.first { $0 is LoadingView }
        UIView.animate(withDuration: 0.3, animations: {
            loadingView?.alpha = 0
        }, completion: { _ in
            loadingView?.removeFromSuperview()
        })
    }
    
    func showSmallLoadingViewController() {
        hideLoadingViewController()
        let smallLoadingViewController = SmallLoadingViewController()
        addChild(viewController: smallLoadingViewController)
        smallLoadingViewController.view.pinAllEdges(to: view)
        smallLoadingViewController.showWithAnimation()
    }
    
    func hideLoadingViewController(completion: (() -> Void)? = nil) {
        let viewController = childViewControllers.first(where: {
            $0 is SmallLoadingViewController
        })
        guard viewController != nil else {
            return
        }
        UIView.animate(withDuration: 0.3, delay: 0, options: .transitionCrossDissolve, animations: {
            viewController!.view.alpha = 0
        }, completion: { [weak self] _ in
            self?.removeChild(viewController: viewController!)
            completion?()
        })
    }
    
    private func showWithAnimation() {
        view.alpha = 0
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .transitionCrossDissolve, animations: { [weak self] in
            self?.view.alpha = 1
        })
    }
    
    func addChild(viewController: UIViewController) {
        viewController.willMove(toParentViewController: self)
        addChildViewController(viewController)
        view.addSubview(viewController.view)
        viewController.didMove(toParentViewController: self)
    }
    
    func removeChild(viewController: UIViewController) {
        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
        viewController.didMove(toParentViewController: nil)
    }
    
    func show(_ viewController: UIViewController) {
        let oldViewController = self.childViewControllers.first
        addChild(viewController: viewController)
        viewController.view.pinAllEdges(to: view)
        viewController.view.alpha = 0
        viewController.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .transitionCrossDissolve, animations: {
            viewController.view.alpha = 1
        }, completion: { [weak self] _ in
            if let oldViewController = oldViewController {
                self?.removeChild(viewController: oldViewController)
            }
        })
    }
}

class SmallLoadingViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        let activityContainerView = createActivityContainerView()
        
        activityContainerView.addSubview(activityIndicator)
        view.addSubview(activityContainerView)
        
        activityContainerView.pinToCenter(of: view)
        NSLayoutConstraint.activate(
            [
                activityContainerView.widthAnchor.constraint(equalToConstant: 100),
                activityContainerView.heightAnchor.constraint(equalToConstant: 100)
            ]
        )
        activityIndicator.pinToCenter(of: activityContainerView)
        activityIndicator.startAnimating()
    }
    
    private func createActivityContainerView() -> UIView {
        let activityContainerView = UIView()
        activityContainerView.backgroundColor = .white
        activityContainerView.layer.cornerRadius = 10
        return activityContainerView
    }
}
