import Foundation
import UIKit

class NewsDetailsView: UIView {
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let contentTextView = UITextView()
    
    var news: NewsViewModel? {
        didSet {
            titleLabel.text = news?.title
            dateLabel.text = news?.publishedAt
            contentTextView.attributedText = news?.content
            
            let screenWidth = UIScreen.main.bounds.size.width
            if let height = news?.content.height(withConstrainedWidth: screenWidth - 64) {
                contentTextView.heightAnchor.constraint(equalToConstant: height).isActive = true
                layoutIfNeeded()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setTitleLabel()
        setDateLabel()
        setContentTextView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: .systemPadding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .systemPadding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding)
            ])
        
        titleLabel.textColor = .darkGray
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.font = .titleLarge
    }
    
    private func setDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .systemPadding),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .systemPadding),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding)
            ])
        
        dateLabel.textColor = .lightGray
        dateLabel.textAlignment = .left
        dateLabel.numberOfLines = 1
        dateLabel.font = .contentLight
    }
    
    private func setContentTextView() {
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentTextView)
        
        NSLayoutConstraint.activate([
            contentTextView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: .systemPadding),
            contentTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .systemPadding),
            contentTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding),
            contentTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.systemPadding)
        ])
        
        contentTextView.isEditable = false
        contentTextView.isScrollEnabled = false
    }
}
