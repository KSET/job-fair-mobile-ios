import UIKit
import SafariServices

class NewsDetailsViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let headerImageView = UIImageView()
    private let newsDetailsView = NewsDetailsView()
    
    private var webViewContentHeight: CGFloat = 0.0
    private let headerViewHeight: CGFloat = 250
    
    let news: NewsViewModel
    
    init(news: NewsViewModel) {
        self.news = news
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = news.id
        view.backgroundColor = .white
        setHeaderView()
        setHeaderViewGradient()
        setScrollView()
        setDetailsView()
        navigationController?.setClearNavigationBar()
    }
    
    private func setHeaderView() {
        headerImageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: headerViewHeight)
        headerImageView.kf.setImage(with: news.imageUrl, placeholder: #imageLiteral(resourceName: "placeholder"))
        headerImageView.contentMode = .scaleAspectFill
        headerImageView.clipsToBounds = true
        view.addSubview(headerImageView)
    }
    
    private func setHeaderViewGradient() {
        let colors: [UIColor] = [
            UIColor.brandColor.withAlphaComponent(0.5),
            UIColor.brandColor.withAlphaComponent(0.3),
            UIColor.clear
        ]
        var gradientHeight = headerImageView.frame
        gradientHeight.size.height = gradientHeight.height * 1.5
        let gradientLayer = CAGradientLayer(frame: gradientHeight, colors: colors)
        let gradientImageView = UIImageView()
        gradientImageView.image = gradientLayer.createGradientImage()
        gradientImageView.frame = gradientLayer.frame
        view.addSubview(gradientImageView)
    }
    
    private func setScrollView() {
        view.addSubview(scrollView)
        
        scrollView.pinAllEdges(to: view)
        scrollView.matchWidth(of: view)
        
        scrollView.contentInset = UIEdgeInsets(top: headerViewHeight, left: 0, bottom: 0, right: 0)
        scrollView.backgroundColor = UIColor.clear
        scrollView.delegate = self
    }
    
    private func setDetailsView() {
        newsDetailsView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(newsDetailsView)
        newsDetailsView.pinAllEdges(to: scrollView)
        newsDetailsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        newsDetailsView.contentTextView.delegate = self
        newsDetailsView.news = news
    }
}

extension NewsDetailsViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setHeaderView(with: scrollView)
        toggleNavigationBarIfNeeded(with: scrollView)
    }
    
    private func setHeaderView(with scrollView: UIScrollView) {
        let y = headerViewHeight - (scrollView.contentOffset.y + headerViewHeight)
        let height = min(y, headerViewHeight * 2)
        headerImageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }
    
    private func toggleNavigationBarIfNeeded(with scrollView: UIScrollView) {
        let y = headerViewHeight - (scrollView.contentOffset.y + headerViewHeight)
        if y >= 0 {
            animateNavigationBarTransparency(with: y)
        } else {
            resetNavigationBarTransparency()
        }
    }
    
    private func animateNavigationBarTransparency(with offset: CGFloat) {
        let gradient = offset/headerViewHeight
        let backgroundColor = UIColor.brandColor.withAlphaComponent(1-gradient)
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = backgroundColor
        UIApplication.shared.statusBarView?.backgroundColor = backgroundColor
    }
    
    private func resetNavigationBarTransparency() {
        navigationController?.navigationBar.backgroundColor = .brandColor
        UIApplication.shared.statusBarView?.backgroundColor = .brandColor
    }
}

extension NewsDetailsViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        return true
    }
}
