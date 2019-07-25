import UIKit
import SnapKit

class CompanyFilterView: UIView {
    
    let nameLabel = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addCornerRadius()
        backgroundColor = .disabledButtonBackgroundColor
        addBorder()
        setupNameLabel()
        setupImageView()
    }
    
    private func setupNameLabel() {
        nameLabel.text = "All"
        nameLabel.textColor = .black
        nameLabel.font = .titleRegular
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(CGFloat.systemPadding)
            make.centerY.equalToSuperview()
        }
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "filter_array")
        imageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-CGFloat.systemPadding)
            make.centerY.equalToSuperview()
            make.leading.greaterThanOrEqualTo(nameLabel.snp.trailing)
        }
    }
}
