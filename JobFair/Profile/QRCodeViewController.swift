import UIKit

class QRCodeViewController: UIViewController {
    
    private let qrCodeView = QRCodeView()
    private let qrCodePayload: String
    
    init(qrCodePayload: String) {
        self.qrCodePayload = qrCodePayload
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationButtons()
        setupQRCodeView()
    }
    
    private func setupQRCodeView() {
        qrCodeView.generateCode(qrCodePayload)
        view.addSubview(qrCodeView)
        qrCodeView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(CGFloat.systemPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.systemPadding)
            make.height.equalTo(qrCodeView.snp.width)
        }
    }
    
    private func setupNavigationButtons() {
        let closeBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close"), style: .plain, target: self, action: #selector(didTapCloseButton))
        navigationItem.leftBarButtonItem = closeBarButtonItem
        navigationItem.rightBarButtonItem = nil
    }
    
    @objc
    private func didTapCloseButton() {
        dismiss(animated: true, completion: nil)
    }
}
