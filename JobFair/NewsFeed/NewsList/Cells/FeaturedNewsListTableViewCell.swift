import UIKit
import Kingfisher

class FeaturedNewsListTableViewCell: UITableViewCell {
    private let newsImageView = UIImageView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    
    private let cellHeight: CGFloat = 150
    private let imageViewMargin: CGFloat = .systemPadding
    
    var news: NewsViewModel? {
        didSet {
            newsImageView.kf.setImage(with: news?.imageUrl, placeholder: #imageLiteral(resourceName: "placeholder"))
            titleLabel.text = news?.title
            dateLabel.text = news?.publishedAt
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setImageView()
        setTitleLabel()
        setDateLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setImageView() {
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(newsImageView)
        
        NSLayoutConstraint.activate([
            newsImageView.heightAnchor.constraint(equalToConstant: cellHeight),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: imageViewMargin),
            newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: imageViewMargin),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -imageViewMargin)
        ])
        
        newsImageView.clipsToBounds = true
        newsImageView.contentMode = .scaleAspectFill
        newsImageView.layer.cornerRadius = 4
    }
    
    private func setTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: newsImageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor)
        ])
        
        titleLabel.textColor = .darkGray
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 2
        titleLabel.font = .titleMedium
    }
    
    private func setDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: newsImageView.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor)
        ])
        
        dateLabel.textColor = .lightGray
        dateLabel.textAlignment = .left
        dateLabel.numberOfLines = 1
        dateLabel.font = .contentLight
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
        dateLabel.text = ""
    }
}
