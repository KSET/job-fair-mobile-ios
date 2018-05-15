import UIKit

class LoadingView: UIView {

    private let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        showActivityIndicatorView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func showActivityIndicatorView() {
        addSubview(activityIndicatorView)
        activityIndicatorView.pinToCenter(of: self)
        activityIndicatorView.color = .brandColor
        activityIndicatorView.startAnimating()
    }
}
