import UIKit

class CompanyListViewController: UIViewController {
    var currentCompanies: CurrentCompanies? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private let logoAndNameCollectionViewCellIdentifier = "LogoAndNameCollectionViewCell"
    private let initialIndustryId = Constants.Common.defaultId
    private var collectionView = JobFairCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    fileprivate var coordinator: CompanyListCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = CompanyListCoordinator(viewController: self, navigationController: navigationController)
        setupUI()
        coordinator.viewDidLoad(industryId: initialIndustryId)
    }

    func showError() {
        coordinator.didGetError(for: initialIndustryId)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = Constants.Companies.title
        setFilterItem()
        setCollectionView()
    }
    
    private func setCollectionView() {
        let layout = JobFairCollectionViewFlowLayout(minimumInteritemSpacing: 0, minimumLineSpacing: 32)
        collectionView = JobFairCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(LogoAndNameCollectionViewCell.self, forCellWithReuseIdentifier: logoAndNameCollectionViewCellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.pinAllEdges(to: view)
    }
    
    private func setFilterItem() {
        let filterBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "filter"), style: .plain, target: self, action: #selector(didTapFilterButton))
        navigationItem.leftBarButtonItem = filterBarButtonItem
    }
    
    @objc private func didTapFilterButton() {
        guard let industryId = currentCompanies?.currentIndustryId else {
            return
        }
        coordinator.didSelectFilterAction(with: industryId)
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
        
        logoAndNameCollectionViewCell.configure(with: company.name, logoImage: nil, logoImageUrl: company.logoUrl, cellType: .company)
        
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
        let width = collectionView.frame.width / 2
        let size = CGSize(width: width, height: width)
        return size
    }
}
