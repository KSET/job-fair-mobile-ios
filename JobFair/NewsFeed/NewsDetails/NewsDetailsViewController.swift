import UIKit
import SafariServices

class NewsDetailsViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let headerImageView = UIImageView()
    private let newsDetailsView = NewsDetailsView()

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
        view.backgroundColor = .white
        setScrollView()
        setDetailsView()
    }
    
    private func setScrollView() {
        view.addSubview(scrollView)
        
        scrollView.pinAllEdges(to: view)
        scrollView.matchWidth(of: view)
        
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

extension NewsDetailsViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        return true
    }
}
