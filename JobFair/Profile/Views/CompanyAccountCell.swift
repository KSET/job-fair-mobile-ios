import UIKit

class CompanyAccountCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let logoImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupLogoImageView()
        setupNameLabel()
        selectionStyle = .none
    }
    
    private func setupLogoImageView() {
        addSubview(logoImageView)
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.backgroundColor = .white
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(CGFloat.systemPadding)
            make.size.equalTo(CGSize(width: 132, height: 112))
        }
    }
    
    private func setupNameLabel() {
        nameLabel.font = .titleRegular
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(CGFloat.systemPadding)
            make.leading.equalToSuperview().offset(CGFloat.systemPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.systemPadding)
            make.bottom.equalToSuperview().offset(-CGFloat.systemPadding)
        }
    }
}
