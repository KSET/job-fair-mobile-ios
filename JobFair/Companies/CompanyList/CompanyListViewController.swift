import UIKit
import SnapKit

class CompanyListViewController: UIViewController {
    
    var currentCompanies: CurrentCompanies? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private let logoAndNameCollectionViewCellIdentifier = "LogoAndNameCollectionViewCell"
    private let initialIndustryId = Constants.Common.defaultId
    private let filterView = CompanyFilterView()
    private var collectionView = JobFairCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var companyFilterViewController = CompanyFilterViewController(delegate: self, currentIndustryId: initialIndustryId)
    fileprivate var coordinator: CompanyListCoordinator!
    
    private let filterViewHeight = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = CompanyListCoordinator(viewController: self, navigationController: navigationController)
        setupUI()
        coordinator.viewDidLoad(industryId: initialIndustryId)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        collapseFilterView()
    }

    func showError() {
        coordinator.didGetError(for: initialIndustryId)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = Constants.Companies.title
        setCollectionView()
        setFilterView()
    }
    
    private func setCollectionView() {
        let layout = JobFairCollectionViewFlowLayout(minimumInteritemSpacing: 0, minimumLineSpacing: .smallPadding)
        collectionView = JobFairCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(LogoAndNameCollectionViewCell.self, forCellWithReuseIdentifier: logoAndNameCollectionViewCellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 8, left: .systemPadding, bottom: .systemPadding, right: .systemPadding)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setFilterView() {
        view.addSubview(filterView)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapFilterButton))
        filterView.addGestureRecognizer(tapRecognizer)
        addFilterViewControllerView()
        filterView.snp.makeConstraints { make in
            make.bottom.equalTo(collectionView.snp.top).offset(-CGFloat.systemPadding)
            make.leading.equalToSuperview().offset(CGFloat.systemPadding)
            make.trailing.equalToSuperview().offset(-CGFloat.systemPadding)
            make.height.equalTo(filterViewHeight)
            make.top.equalToSuperview().offset(CGFloat.systemPadding)
        }
    }
        
    private func addFilterViewControllerView() {
        companyFilterViewController.view.alpha = 0
        addChild(viewController: companyFilterViewController)
        companyFilterViewController.view.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(filterView)
            make.height.equalTo(filterViewHeight)
        }
        view.layoutIfNeeded()
    }
    
    @objc private func didTapFilterButton() {
        expandFilterView()
    }
    
    private func expandFilterView() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.companyFilterViewController.view.alpha = 1
            self?.companyFilterViewController.view.snp.updateConstraints { make in
                make.height.equalTo(300)
            }
            self?.view.layoutIfNeeded()
        }
    }
}

extension CompanyListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentCompanies?.companies.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let logoAndNameCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: logoAndNameCollectionViewCellIdentifier, for: indexPath)
            as? LogoAndNameCollectionViewCell,
            let company = currentCompanies?.companies[indexPath.row] else {
                return UICollectionViewCell()
        }
        
        logoAndNameCollectionViewCell.configure(with: company.name, logoImageUrl: company.logoUrl)
        
        return logoAndNameCollectionViewCell
    }
}

extension CompanyListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let companies = currentCompanies?.companies {
            coordinator.didSelectCompany(companies, index: indexPath.row)
        }
    }
    
}

extension CompanyListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewInsetSum = collectionView.contentInset.left + collectionView.contentInset.right
        let width = (collectionView.frame.width - CGFloat.smallPadding - collectionViewInsetSum) / 2
        return CGSize(width: width, height: 140)
    }
}

extension CompanyListViewController: CompanyFilterViewControllerDelegate {
    
    func showErrorDialog() {
        coordinator.didGetError(for: initialIndustryId)
    }
    
    func didSelectIndustry(_ industry: IndustryViewModel) {
        filterView.nameLabel.text = industry.name
        coordinator.didSelectIndustry(industry.id)
        collapseFilterView()
    }
    
    private func collapseFilterView() {
        UIView.animate(
            withDuration: 0.3,
            animations: { [weak self] in
                self?.companyFilterViewController.view.alpha = 0
            },
            completion: { [weak self] _ in
                self?.companyFilterViewController.view.snp.updateConstraints { make in
                    make.height.equalTo(self!.filterViewHeight)
                }
        })
    }
}
