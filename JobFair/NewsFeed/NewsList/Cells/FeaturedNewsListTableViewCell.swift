import UIKit
import Kingfisher

class FeaturedNewsListTableViewCell: UITableViewCell {
    private let containerView = UIView()
    private let newsImageView = UIImageView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    
    private let cellHeight: CGFloat = 95
    
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
        setContainerView()
        setImageView()
        setTitleLabel()
        setDateLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        newsImageView.roundCorners(corners: [.topLeft, .topRight], radius: 12)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setContainerView() {
        addSubview(containerView)
        containerView.backgroundColor = .white
        containerView.addCornerRadius()
        containerView.addBorder()
        containerView.addShadow()
        containerView.pinAllEdges(to: self, insets: .init(top: .systemPadding, left: .systemPadding, bottom: .smallPadding, right: .systemPadding))
    }
    
    private func setImageView() {
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(newsImageView)
        
        NSLayoutConstraint.activate([
            newsImageView.heightAnchor.constraint(equalToConstant: cellHeight),
            newsImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            newsImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        newsImageView.clipsToBounds = true
        newsImageView.contentMode = .scaleAspectFill
    }
    
    private func setTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: .systemPadding),
            titleLabel.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor)
        ])
        
        titleLabel.textColor = .brandColor
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 2
        titleLabel.font = .cellTitleMedium
    }
    
    private func setDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .systemPadding),
            dateLabel.leadingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: .systemPadding),
            dateLabel.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -.systemPadding)
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
