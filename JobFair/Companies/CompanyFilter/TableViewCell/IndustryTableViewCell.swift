import UIKit

class IndustryTableViewCell: UITableViewCell {
    private var industry: IndustryViewModel?
    private var nameLabel = UILabel()
    private let checkHeight: CGFloat = 22
    private var checkImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with industry: IndustryViewModel, isCurrent: Bool) {
        self.industry = industry
        setCheckImageView(with: isCurrent)
        setNameLabel(with: isCurrent)
    }
    
    private func addSubviews() {
        addCheckImageView()
        addNameLabel()
    }
    
    private func addNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: .systemPadding),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.systemPadding),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .systemPadding),
            nameLabel.trailingAnchor.constraint(equalTo: checkImageView.leadingAnchor, constant: -.systemPadding)
        ])
    }
    
    private func addCheckImageView() {
        checkImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(checkImageView)
        NSLayoutConstraint.activate([
            checkImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkImageView.heightAnchor.constraint(equalToConstant: checkHeight),
            checkImageView.widthAnchor.constraint(equalTo: checkImageView.heightAnchor),
            checkImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding)
        ])
    }
    
    private func setNameLabel(with isCurrent: Bool) {
        nameLabel.text = industry?.name
        nameLabel.numberOfLines = 2
        nameLabel.font = .titleRegular
    }
    
    private func setCheckImageView(with isCurrent: Bool) {
        checkImageView.image = isCurrent ? #imageLiteral(resourceName: "check") : nil
    }
}
