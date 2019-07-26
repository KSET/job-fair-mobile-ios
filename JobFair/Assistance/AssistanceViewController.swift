import UIKit
import RxKeyboard
import RxSwift

class AssistanceViewController: UIViewController {
    
    weak var delegate: DismissDelegate?
    
    private let assistanceView = AssistanceView()
    private let disposeBag = DisposeBag()
    private var coordinator: AssistanceCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.Assistance.title
        navigationController?.setDefaultNavigationBarAppearance()
        coordinator = AssistanceCoordinator(viewController: self)
        setupUI()
        addKeyboardDismissRecognizer()
    }
    
    func showInfoPopup(with infoPopupViewModel: InfoPopupViewModel) {
        let infoPopup = InfoPopupViewController(viewModel: infoPopupViewModel)
        infoPopup.delegate = delegate
        present(BaseNavigationController(rootViewController: infoPopup), animated: true, completion: nil)
    }
    
    func showErrorAlert() {
        coordinator.showErrorAlert()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        setupAssistanceView()
        setCloseButton()
        observeKeyboardAppereance()
    }
    
    private func setupAssistanceView() {
        view.addSubview(assistanceView)
        assistanceView.delegate = self
        assistanceView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(bottomLayoutGuide.snp.top)
            make.top.equalTo(topLayoutGuide.snp.bottom)
        }
    }
    
    private func observeKeyboardAppereance() {
        RxKeyboard.instance.visibleHeight.skip(1)
            .drive(onNext: { [weak self] keyboardVisibleHeight in
                UIView.animate(withDuration: 0.3) {
                    self?.assistanceView.bottomOffsetConstraint.constant = -(keyboardVisibleHeight + .systemPadding)
                    self?.view.layoutIfNeeded()
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func setCloseButton() {
        let closeBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close"), style: .plain, target: self, action: #selector(didTapCloseButton))
        navigationItem.leftBarButtonItem = closeBarButtonItem
    }
    
    @objc
    private func didTapCloseButton() {
        delegate?.didTapCloseButton()
    }
}

extension AssistanceViewController: AssistanceViewDelegate {
    
    func didTapAskButton(with text: String) {
        coordinator.didTapButtonWith(text: text)
    }
}
