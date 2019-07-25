import UIKit

protocol ProfileDelegate: class {
    func didTapLogoutButton()
}

class ProfileViewController: UIViewController {
    
    weak var delegate: ProfileDelegate?
    
    private lazy var studentView = StudentProfileView(user: user)
    private lazy var companyView = CompanyProfileView(companies: user.companies)
    private let signOutButton = UIButton.primaryButton
    
    private let user: User
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAccountView()
        addSignOutButton()
    }
    
    private func addAccountView() {
        if user.role == .company {
            addCompanyView()
        } else {
            addStudentView()
        }
    }
    
    private func addStudentView() {
        studentView.delegate = self
        view.addSubview(studentView)
        studentView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-76)
            make.leading.trailing.top.equalToSuperview()
        }
    }
    
    private func addCompanyView() {
        view.addSubview(companyView)
        companyView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-76)
            make.leading.trailing.top.equalToSuperview()
        }
    }
    
    private func addSignOutButton() {
        signOutButton.setTitle(Constants.StudentProfile.signOutButtonTitle, for: .normal)
        signOutButton.addTarget(self, action: #selector(didTapSignOutButton), for: .touchUpInside)
        view.addSubview(signOutButton)
        signOutButton.snp.makeConstraints { make in
            make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(-CGFloat.systemPadding)
            make.leading.equalToSuperview().offset(CGFloat.systemPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.systemPadding)
            make.height.equalTo(44)
        }
    }
    
    @objc
    private func didTapSignOutButton() {
        delegate?.didTapLogoutButton()
    }
}

extension ProfileViewController: StudentProfileViewDelegate {
    
    func didTapQRCode() {
        let viewController = QRCodeViewController(qrCodePayload: user.qrCodePayload)
        let navigationController = BaseNavigationController(rootViewController: viewController)
        present(navigationController, animated: true, completion: nil)
    }
}
