import UIKit

protocol StudentProfileViewDelegate: class {
    func didTapQRCode()
}

class StudentProfileView: UIView {
    
    weak var delegate: StudentProfileViewDelegate?
    
    private let nameHeaderLabel = UILabel()
    private let nameLabel = UILabel()
    private let qrCodeView = QRCodeView()
    private let qrCodeCaptionLabel = UILabel()
    
    private let user: User

    init(user: User) {
        self.user = user
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupNameHeaderLabel()
        setupNameLabel()
        setupCodeImageView()
        setupCodeCaptionLabel()
    }
    
    private func setupNameHeaderLabel() {
        nameHeaderLabel.text = Constants.StudentProfile.nameHeaderTitle.uppercased()
        nameHeaderLabel.font = .headerTitle
        nameHeaderLabel.textColor = .secondaryColor
        addSubview(nameHeaderLabel)
        nameHeaderLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CGFloat.systemPadding)
            make.leading.equalToSuperview().offset(CGFloat.bigPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.bigPadding)
        }
    }
    
    private func setupNameLabel() {
        nameLabel.text = user.name
        nameLabel.font = .titleRegular
        nameLabel.textColor = .black
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameHeaderLabel.snp.bottom).offset(CGFloat.systemPadding)
            make.leading.equalToSuperview().offset(CGFloat.bigPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.bigPadding)
        }
    }
    
    private func setupCodeImageView() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapQRCodeView))
        qrCodeView.addGestureRecognizer(tapRecognizer)
        
        addSubview(qrCodeView)
        qrCodeView.addShadow()
        qrCodeView.generateCode(user.qrCodePayload)
        qrCodeView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-CGFloat.bigPadding)
            make.size.equalTo(CGSize(width: 248, height: 248))
        }
    }
    
    private func setupCodeCaptionLabel() {
        qrCodeCaptionLabel.textAlignment = .center
        qrCodeCaptionLabel.text = Constants.StudentProfile.codeCaption
        qrCodeCaptionLabel.font = .titleRegular
        qrCodeCaptionLabel.textColor = .secondaryColor
        addSubview(qrCodeCaptionLabel)
        qrCodeCaptionLabel.snp.makeConstraints { make in
            make.top.equalTo(qrCodeView.snp.bottom).offset(CGFloat.systemPadding)
            make.centerX.equalToSuperview()
            
        }
    }
    
    @objc
    private func didTapQRCodeView() {
        delegate?.didTapQRCode()
    }
}
