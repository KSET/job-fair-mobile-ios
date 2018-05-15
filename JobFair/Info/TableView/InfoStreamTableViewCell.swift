import UIKit

protocol InfoStreamTableViewCellDelegate: class {
    func didSelectDayOneStreamAction()
    func didSelectDayTwoStreamAction()
}

class InfoStreamTableViewCell: UITableViewCell {
    private let stackViewHeight: CGFloat = 80
    private var titleLabel = UILabel()
    private var stackView = UIStackView()
    private weak var infoStreamTableViewCellDelegate: InfoStreamTableViewCellDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with infoStreamTableViewCellDelegate: InfoStreamTableViewCellDelegate?, title: String) {
        self.infoStreamTableViewCellDelegate = infoStreamTableViewCellDelegate
        setupStackView()
        setTitleLabel(with: title)
        selectionStyle = .none
    }
    
    private func setupUI() {
        setupTitleLabelConstraints()
        setupStackViewConstraints()
    }
    
    private func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: .systemPadding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .systemPadding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding)
        ])
    }
    
    private func setupStackViewConstraints() {
        let dayOneIconedLabel = createIconedLabel(with: Constants.Stream.dayOne, and: #selector(didTapDayOneIconedLabel))
        let dayTwoIconedLabel = createIconedLabel(with: Constants.Stream.dayTwo, and: #selector(didTapDayTwoIconedLabel))
        
        stackView = UIStackView(arrangedSubviews: [dayOneIconedLabel, dayTwoIconedLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: stackViewHeight),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setTitleLabel(with title: String) {
        titleLabel.text = title
        titleLabel.font = .titleMedium
    }
    
    private func setupStackView() {
        stackView.distribution = .fillProportionally
        stackView.spacing = 50
    }
    
    private func createIconedLabel(with text: String, and selector: Selector) -> IconedLabel {
        let iconedLabel = IconedLabel()
        iconedLabel.textLabel.text = text
        iconedLabel.imageView.image = #imageLiteral(resourceName: "youtube")
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: selector)
        iconedLabel.addGestureRecognizer(tapGestureRecognizer)
        return iconedLabel
    }
    
    @objc func didTapDayOneIconedLabel() {
        infoStreamTableViewCellDelegate?.didSelectDayOneStreamAction()
    }
    
    @objc func didTapDayTwoIconedLabel() {
        infoStreamTableViewCellDelegate?.didSelectDayTwoStreamAction()
    }
}
