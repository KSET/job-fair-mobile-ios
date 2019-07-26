import UIKit

class IndustryTableViewCell: UITableViewCell {
    private var industry: IndustryViewModel?
    private var nameLabel = UILabel()
    private var checkImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with industry: IndustryViewModel, isFirst: Bool, isCurrent: Bool) {
        self.industry = industry
        checkImageView.image = isFirst ? UIImage(named: "filter_array") : nil
        nameLabel.font = isCurrent ? .cellTitleMedium : .titleRegular
        setNameLabel(with: isCurrent)
        rotateImageView()
    }
    
    private func addSubviews() {
        addCheckImageView()
        addNameLabel()
    }
    
    private func addNameLabel() {
        nameLabel.numberOfLines = 2
        nameLabel.font = .titleRegular
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: .systemPadding),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.systemPadding),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .systemPadding),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: checkImageView.leadingAnchor, constant: -.systemPadding)
        ])
    }
    
    private func addCheckImageView() {
        checkImageView.translatesAutoresizingMaskIntoConstraints = false
        checkImageView.contentMode = .scaleAspectFit
        addSubview(checkImageView)
        NSLayoutConstraint.activate([
            checkImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding)
        ])
    }
    
    private func setNameLabel(with isCurrent: Bool) {
        nameLabel.text = industry?.name
    }
    
    private func rotateImageView() {
        UIView.animate(withDuration: 0.35) { [weak self] in
            self?.checkImageView.transform = CGAffineTransform(rotationAngle: .pi)
        }
    }
}
