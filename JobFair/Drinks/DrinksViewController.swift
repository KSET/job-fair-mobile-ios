import UIKit
import SnapKit
import RxSwift
import RxCocoa

class DrinksViewController: UIViewController {
    
    private var coordinator: DrinksCoordinator!
    
    weak var delegate: DismissDelegate?
    
    var viewModels = [DrinkViewModel]() {
        didSet {
            tableView.reloadData()
            relays = viewModels.map { _ in
                return BehaviorRelay<Int>(value: 0)
            }
            startObserving()
        }
    }
    
    var relays: [BehaviorRelay<Int>] = []
    let disposeBag = DisposeBag()
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = UITableViewAutomaticDimension
        view.estimatedRowHeight = 100
        view.separatorStyle = .none
        view.register(DrinkTableViewCell.self, forCellReuseIdentifier: DrinkTableViewCell.identifier)
        view.dataSource = self
        
        return view
    }()
    
    lazy var orderButton: UIButton = {
        let view = UIButton.primaryButton
        view.setTitle(Constants.Drinks.buttonText, for: .normal)
        view.addTarget(self, action: #selector(didTapOrderButton), for: .touchUpInside)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.Drinks.title
        navigationController?.setDefaultNavigationBarAppearance()
        coordinator = DrinksCoordinator(viewController: self)
        coordinator.viewDidLoad()
        setupUI()
    }
    
    func showInfoPopup(with infoPopupViewModel: InfoPopupViewModel) {
        let infoPopup = InfoPopupViewController(viewModel: infoPopupViewModel)
        infoPopup.delegate = delegate
        present(BaseNavigationController(rootViewController: infoPopup), animated: true, completion: nil)
    }
    
    func showErrorAlert() {
        coordinator.showErrorAlert()
    }
    
    private func startObserving() {
        Observable
            .combineLatest(relays.map { $0.asObservable().map({ $0 > 0 }) })
            .observeOn(MainScheduler.instance)
            .flatMap({ (values) -> Observable<Bool> in
                return .just(values.reduce(false, { $0 || $1 }))
            })
            .bind(to: orderButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        setCloseButton()
        loadSubviews()
        setConstraints()
    }
    
    private func loadSubviews() {
        view.addSubview(tableView)
        view.addSubview(orderButton)
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
        }
        orderButton.snp.makeConstraints { (make) in
            make.height.equalTo(48)
            make.top.equalTo(tableView.snp.bottom).offset(CGFloat.systemPadding)
            make.left.right.equalToSuperview().inset(CGFloat.systemPadding)
            make.bottom.equalTo(bottomLayoutGuide.snp.top).inset(-CGFloat.smallPadding)
        }
    }
    
    private func setCloseButton() {
        let closeBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close"), style: .plain, target: self, action: #selector(didTapCloseButton))
        navigationItem.leftBarButtonItem = closeBarButtonItem
    }
    
    @objc func didTapCloseButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapOrderButton() {
        var amountMap = [String: Int]()
        viewModels.enumerated().forEach { (index, viewModel) in
            guard relays[index].value > 0 else {
                return
            }
            
            amountMap[viewModel.title] = relays[index].value
        }
        coordinator.didTapOrderButton(with: amountMap)
    }
}

extension DrinksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DrinkTableViewCell.identifier, for: indexPath) as? DrinkTableViewCell else {
            return UITableViewCell()
        }
        cell.viewModel = viewModels[indexPath.row]
        cell.delegate = self
        
        return cell
    }
}

extension DrinksViewController: DrinkTableViewCellDelegate {
    
    func didSelectPlusAction(in cell: DrinkTableViewCell) {
        guard let index = tableView.indexPath(for: cell)?.row else { return }
        let relay = relays[index]
        if relay.value < Constants.Drinks.maxDrinks {
            let newValue = relay.value + 1
            cell.setDrinkAmount(newValue, minusEnabled: true, plusEnabled: newValue < Constants.Drinks.maxDrinks)
            relay.accept(newValue)
        }
    }
    
    func didSelectMinusAction(in cell: DrinkTableViewCell) {
        guard let index = tableView.indexPath(for: cell)?.row else { return }
        let relay = relays[index]
        if relay.value > 0 {
            let newValue = relay.value - 1
            cell.setDrinkAmount(newValue, minusEnabled: newValue > 0, plusEnabled: true)
            relay.accept(newValue)
        }
    }
}
