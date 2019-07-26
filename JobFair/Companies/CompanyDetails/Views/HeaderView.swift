import UIKit

class HeaderView: UIView {
    
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    let imageView = UIImageView()
    
    private let mainStackView = UIStackView()
    private let detailsStackView = UIStackView()
    private let separatorView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = .white
        addCornerRadius()
        addBorder()
        setupMainStackView()
        setupDetailsStackView()
        setupSeparatorView()
        setupImageView()
        setupLabels()
    }
    
    private func setupMainStackView() {
        addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(CGFloat.systemPadding)
        }
        mainStackView.addArrangedSubview(imageView)
        mainStackView.addArrangedSubview(detailsStackView)
        mainStackView.alignment = .center
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 64
    }
    
    private func setupDetailsStackView() {
        detailsStackView.spacing = .smallPadding
        detailsStackView.alignment = .leading
        detailsStackView.axis = .vertical
        detailsStackView.addArrangedSubview(titleLabel)
        detailsStackView.addArrangedSubview(dateLabel)
        detailsStackView.addArrangedSubview(timeLabel)
    }
    
    private func setupImageView() {
        imageView.layer.cornerRadius = 60
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 120, height: 120))
        }
    }
    
    private func setupSeparatorView() {
        mainStackView.addSubview(separatorView)
        separatorView.backgroundColor = .borderColor
        separatorView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(0.5)
        }
    }
    
    private func setupLabels() {
        titleLabel.numberOfLines = 0
        titleLabel.font = .cellTitleMedium
        dateLabel.font = .titleRegular
        timeLabel.font = .titleRegular
        titleLabel.textColor = .black
        dateLabel.textColor = .secondaryColor
        timeLabel.textColor = .secondaryColor
    }
}
