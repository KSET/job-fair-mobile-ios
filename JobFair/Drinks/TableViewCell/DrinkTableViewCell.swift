import SnapKit

protocol DrinkTableViewCellDelegate: class {
    func didSelectPlusAction(in cell: DrinkTableViewCell)
    func didSelectMinusAction(in cell: DrinkTableViewCell)
}

class DrinkTableViewCell: UITableViewCell {
    static let identifier = "DrinkTableViewCell"
    
    var viewModel: DrinkViewModel? {
        didSet {
            configure()
        }
    }
    
    weak var delegate: DrinkTableViewCellDelegate?
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .headerTitle
        view.textColor = .secondaryColor
        
        return view
    }()
    
    lazy var drinkImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    lazy var minusButton: UIButton = {
        let view = UIButton.actionButton
        view.addTarget(self, action: #selector(didTapActionButton(_:)), for: .touchUpInside)
        view.setTitle("-", for: .normal)
        view.isEnabled = false
        
        return view
    }()
    
    lazy var shadowMinusView: UIView = .shadowView(with: minusButton)
    
    lazy var amountLabel: UILabel = {
        let view = UILabel()
        view.font = .detailTitle
        view.textColor = .darkGray
        view.textAlignment = .center
        view.text = "0"
        
        return view
    }()
    
    lazy var plusButton: UIButton = {
        let view = UIButton.actionButton
        view.addTarget(self, action: #selector(didTapActionButton(_:)), for: .touchUpInside)
        view.setTitle("+", for: .normal)
        
        return view
    }()
    
    lazy var shadowPlusView: UIView = .shadowView(with: plusButton)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        loadSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDrinkAmount(_ amount: Int, minusEnabled: Bool, plusEnabled: Bool) {
        amountLabel.text = "\(amount)"
        minusButton.isEnabled = minusEnabled
        plusButton.isEnabled = plusEnabled
    }
    
    // MARK: Private
    private func loadSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(drinkImageView)
        contentView.addSubview(shadowMinusView)
        contentView.addSubview(amountLabel)
        contentView.addSubview(shadowPlusView)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(CGFloat.bigPadding)
            make.top.equalToSuperview().inset(CGFloat.bigPadding)
        }
        drinkImageView.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(CGFloat.bigPadding)
            make.width.height.equalTo(50)
            make.bottom.equalToSuperview().inset(CGFloat.smallPadding)
        }
        shadowPlusView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(CGFloat.bigPadding)
            make.width.height.equalTo(64)
            make.centerY.equalTo(drinkImageView)
        }
        amountLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(plusButton)
            make.width.equalTo(25)
            make.right.equalTo(plusButton.snp.left).offset(-CGFloat.bigPadding)
        }
        shadowMinusView.snp.makeConstraints { (make) in
            make.centerY.equalTo(plusButton)
            make.width.height.equalTo(64)
            make.right.equalTo(amountLabel.snp.left).offset(-CGFloat.bigPadding)
            make.left.greaterThanOrEqualTo(drinkImageView.snp.right).offset(-CGFloat.smallPadding)
        }
    }
    
    private func configure() {
        titleLabel.text = viewModel?.title.uppercased()
        drinkImageView.image = viewModel?.image
    }
    
    @objc private func didTapActionButton(_ button: UIButton) {
        switch button {
        case minusButton:
            delegate?.didSelectMinusAction(in: self)
        case plusButton:
            delegate?.didSelectPlusAction(in: self)
        default:
            break
        }
    }
}
