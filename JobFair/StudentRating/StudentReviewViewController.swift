import UIKit
import RxKeyboard
import RxSwift

class StudentReviewViewController: UIViewController {
    
    weak var delegate: DismissDelegate?
    
    private let studentReviewView = StudentReviewView()
    private let disposeBag = DisposeBag()
    private let studentInfo: StudentInfo
    private var coordinator: StudentReviewCoordinator!
    
    init(studentInfo: StudentInfo) {
        self.studentInfo = studentInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(studentInfo.firstName) \(studentInfo.lastName)"
        view.backgroundColor = .white
        addKeyboardDismissRecognizer()
        addReviewView()
        addKeyboardObserver()
        addCloseButton()
        coordinator = StudentReviewCoordinator(viewController: self)
    }
    
    func showErrorAlert() {
        coordinator.showErrorAlert()
    }
    
    private func addReviewView() {
        studentReviewView.submitButton.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
        view.addSubview(studentReviewView)
        studentReviewView.snp.makeConstraints { make in
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(bottomLayoutGuide.snp.top).priority(.low)
        }
    }
    
    private func addKeyboardObserver() {
        RxKeyboard.instance.visibleHeight
            .drive(onNext: { [weak self] keyboardVisibleHeight in
                self?.studentReviewView.contentOffset.y = keyboardVisibleHeight
            })
            .disposed(by: disposeBag)
    }
    
    private func addCloseButton() {
        let closeBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close"), style: .plain, target: self, action: #selector(didTapCloseButton))
        navigationItem.leftBarButtonItem = closeBarButtonItem
    }
    
    @objc
    private func didTapCloseButton() {
        delegate?.didTapCloseButton()
    }
    
    @objc
    private func didTapSubmitButton() {
        let reviewInfo = StudentReviewInfo(ambition: Int(studentReviewView.ambitionRateView.rating),
                                 socialSkills: Int(studentReviewView.ambitionRateView.rating),
                                 technicalSkills: Int(studentReviewView.ambitionRateView.rating),
                                 notes: studentReviewView.textView.text,
                                 resumeUid: studentInfo.resumeUid)
        coordinator.didTapSubmitButton(for: reviewInfo)
    }
}
