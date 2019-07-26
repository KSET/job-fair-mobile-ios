import UIKit
import Cosmos

class StudentReviewView: UIScrollView {
    
    let submitButton = UIButton.primaryButton
    let ambitionRateView = CosmosView()
    let socialSkillsRateView = CosmosView()
    let technicalSkillsRateView = CosmosView()
    let textView = InputTextView()
    
    private let contentView = UIView()
    private let ambitionLabel = UILabel()
    private let socialSkillsLabel = UILabel()
    private let technicalSkillsLabel = UILabel()
    
    private let notesHeaderLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupContentView()
        setupAmbitionStackView()
        setupSocialSkillStackView()
        setupTechnicalSkillStackView()
        setupNotesHeaderLabel()
        setupTextView()
        setupSubmitButton()
    }
    
    private func setupContentView() {
        addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    private func setupAmbitionStackView() {
        setupAmbitionLabel()
        ambitionRateView.rating = 0
        let stackView = UIStackView(arrangedSubviews: [ambitionLabel, ambitionRateView])
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CGFloat.bigPadding * 2)
            make.leading.equalToSuperview().offset(CGFloat.bigPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.bigPadding)
        }
    }
    
    private func setupAmbitionLabel() {
        ambitionLabel.text = Constants.StudentReview.ambitionTitle.uppercased()
        ambitionLabel.textColor = .secondaryColor
        ambitionLabel.font = .contentBold
    }
    
    private func setupSocialSkillStackView() {
        setupSocialSkillLabel()
        socialSkillsRateView.rating = 0
        let stackView = UIStackView(arrangedSubviews: [socialSkillsLabel, socialSkillsRateView])
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(ambitionRateView.snp.bottom).offset(CGFloat.bigPadding)
            make.leading.equalToSuperview().offset(CGFloat.bigPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.bigPadding)
        }
    }
    
    private func setupSocialSkillLabel() {
        socialSkillsLabel.text = Constants.StudentReview.socialSkillsTitle.uppercased()
        socialSkillsLabel.textColor = .secondaryColor
        socialSkillsLabel.font = .contentBold
    }
    
    private func setupTechnicalSkillStackView() {
        setupTechnicalSkillLabel()
        technicalSkillsRateView.rating = 0
        let stackView = UIStackView(arrangedSubviews: [technicalSkillsLabel, technicalSkillsRateView])
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(socialSkillsRateView.snp.bottom).offset(CGFloat.bigPadding)
            make.leading.equalToSuperview().offset(CGFloat.bigPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.bigPadding)
        }
    }
    
    private func setupTechnicalSkillLabel() {
        technicalSkillsLabel.text = Constants.StudentReview.technicalSkills.uppercased()
        technicalSkillsLabel.textColor = .secondaryColor
        technicalSkillsLabel.font = .contentBold
    }
    
    private func setupNotesHeaderLabel() {
        notesHeaderLabel.textColor = .secondaryColor
        notesHeaderLabel.font = .headerTitle
        notesHeaderLabel.text = Constants.StudentReview.studentNotes.uppercased()
        contentView.addSubview(notesHeaderLabel)
        notesHeaderLabel.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(technicalSkillsRateView.snp.bottom)
            make.leading.equalToSuperview().offset(CGFloat.systemPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.systemPadding)
        }
    }
    
    private func setupTextView() {
        contentView.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(CGFloat.systemPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.systemPadding)
            make.top.equalTo(notesHeaderLabel.snp.bottom).offset(CGFloat.smallPadding)
            make.height.equalTo(snp.height).multipliedBy(0.35)
        }
    }
    
    private func setupSubmitButton() {
        submitButton.setTitle(Constants.StudentReview.submitButtonTitle, for: .normal)
        contentView.addSubview(submitButton)
        submitButton.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(textView.snp.bottom).offset(CGFloat.systemPadding)
            make.height.equalTo(44)
            make.leading.equalToSuperview().offset(CGFloat.systemPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.systemPadding)
            make.bottom.equalToSuperview().offset(-CGFloat.systemPadding)
        }
    }
}
