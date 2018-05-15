import UIKit
import Kingfisher

class NewsListTableViewCell: UITableViewCell {
    private let newsImageView = UIImageView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    
    private let newsThumbnailSize: CGFloat = 80
    
    var news: NewsViewModel? {
        didSet {
            newsImageView.kf.setImage(with: news?.thumbnailUrl, placeholder: #imageLiteral(resourceName: "placeholder"))
            titleLabel.text = news?.title
            titleLabel.sizeToFit()
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
            newsImageView.widthAnchor.constraint(equalToConstant: newsThumbnailSize),
            newsImageView.heightAnchor.constraint(equalToConstant: newsThumbnailSize),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .systemPadding),
            newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: .systemPadding),
            newsImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.systemPadding)
        ])
        
        newsImageView.clipsToBounds = true
        newsImageView.contentMode = .scaleAspectFill
        newsImageView.layer.cornerRadius = 4
    }
    
    private func setTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: newsImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: .systemPadding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding)
        ])
        
        titleLabel.textColor = .darkGray
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 2
        titleLabel.font = .titleRegular
        titleLabel.textAlignment = .left
    }
    
    private func setDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: .systemPadding),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
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
