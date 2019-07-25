import UIKit
import Kingfisher

class NewsListTableViewCell: UITableViewCell {
    
    private let containerView = UIView()
    private let newsImageView = UIImageView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    
    private let newsThumbnailSize: CGSize = CGSize(width: 75, height: 100)
    
    var news: NewsViewModel? {
        didSet {
            newsImageView.kf.setImage(with: news?.thumbnailUrl, placeholder: #imageLiteral(resourceName: "placeholder"))
            titleLabel.text = news?.title
            dateLabel.text = news?.publishedAt
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setContainerView()
        setImageView()
        setTitleLabel()
        setDateLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setContainerView() {
        contentView.addSubview(containerView)
        containerView.backgroundColor = .white
        containerView.addCornerRadius()
        containerView.addShadow()
        containerView.addBorder()
        containerView.pinAllEdges(to: contentView, insets: .init(top: .smallPadding, left: .systemPadding, bottom: .smallPadding, right: .systemPadding))
    }
    
    private func setImageView() {
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(newsImageView)
        
        NSLayoutConstraint.activate([
            newsImageView.widthAnchor.constraint(equalToConstant: newsThumbnailSize.width),
            newsImageView.heightAnchor.constraint(equalToConstant: newsThumbnailSize.height),
            newsImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .smallPadding),
            newsImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: .smallPadding),
            newsImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -.smallPadding)
        ])
        
        newsImageView.clipsToBounds = true
        newsImageView.contentMode = .scaleAspectFill
        newsImageView.layer.cornerRadius = 4
    }
    
    private func setTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.backgroundColor = .white
        containerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: newsImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: .systemPadding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -.systemPadding)
        ])
        
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 2
        titleLabel.font = .cellTitleMedium
        titleLabel.textAlignment = .left
    }
    
    private func setDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.backgroundColor = .white
        containerView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: .systemPadding),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -.systemPadding),
            dateLabel.bottomAnchor.constraint(equalTo: newsImageView.bottomAnchor)
        ])
        
        dateLabel.textColor = .secondaryColor
        dateLabel.textAlignment = .left
        dateLabel.numberOfLines = 1
        dateLabel.font = .contentLight
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
        dateLabel.text = ""
    }
}
