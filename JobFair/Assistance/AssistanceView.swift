import UIKit

protocol AssistanceViewDelegate: class {
    func didTapAskButton(with text: String)
}

class AssistanceView: UIView {
    
    var bottomOffsetConstraint: NSLayoutConstraint!
    
    weak var delegate: AssistanceViewDelegate?
    
    private let titleLabel = UILabel()
    private let textView = InputTextView()
    private let askButton = UIButton.primaryButton
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupTitleLabel()
        setupTextView()
        setupButton()
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.font = .headerTitle
        titleLabel.textColor = .secondaryColor
        titleLabel.text = Constants.Assistance.headerText.uppercased()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .systemPadding),
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: .systemPadding + .smallPadding),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding)
            ]
        )
    }
    
    private func setupTextView() {
        addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        let textViewHeightConstraint = textView.heightAnchor.constraint(equalToConstant: 220)
        textViewHeightConstraint.priority = .defaultLow
        NSLayoutConstraint.activate(
            [
                textView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .systemPadding),
                textView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
                textViewHeightConstraint
            ]
        )
    }
    
    private func setupButton() {
        addSubview(askButton)
        askButton.setTitle(Constants.Assistance.buttonText, for: .normal)
        askButton.translatesAutoresizingMaskIntoConstraints = false
        askButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        bottomOffsetConstraint = askButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.systemPadding)
        let buttonTopConstraint = askButton.topAnchor.constraint(greaterThanOrEqualTo: textView.bottomAnchor, constant: .systemPadding)
        buttonTopConstraint.priority = .required
        NSLayoutConstraint.activate(
            [
                buttonTopConstraint,
                bottomOffsetConstraint,
                askButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                askButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
                askButton.heightAnchor.constraint(equalToConstant: 48)
            ]
        )
    }
    
    @objc
    private func didTapButton() {
        guard textView.text == textView.textViewPlaceholder else {
            delegate?.didTapAskButton(with: textView.text)
            return
        }
        
        delegate?.didTapAskButton(with: "")
    }
}
