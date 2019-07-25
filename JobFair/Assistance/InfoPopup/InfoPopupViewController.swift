import UIKit

protocol DismissDelegate: class {
    func didTapCloseButton()
}

class InfoPopupViewController: UIViewController {
    
    weak var delegate: DismissDelegate?
    
    private let infoPopupView = InfoPopupView()
    
    init(viewModel: InfoPopupViewModel) {
        infoPopupView.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setNavigationButtons()
    }
    
    private func addSubview() {
        view.addSubview(infoPopupView)
        infoPopupView.pinAllEdges(to: view)
    }
    
    private func setNavigationButtons() {
        let closeBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close"), style: .plain, target: self, action: #selector(didTapCloseButton))
        navigationItem.leftBarButtonItem = closeBarButtonItem
        navigationItem.rightBarButtonItem = nil
    }
    
    @objc func didTapCloseButton() {
        delegate?.didTapCloseButton()
    }
}
