import UIKit

protocol InfoSocialTableViewCellDelegate: class {
    func didSelectSocialNetworkWithLink(_ url: URL)
}

class InfoSocialTableViewCell: UITableViewCell {
    weak var infoSocialTableViewCellDelegate: InfoSocialTableViewCellDelegate!
    var viewModel: InfoViewModel? {
        didSet {
            configure()
        }
    }
    
    private let logoAndNameCollectionViewCellIdentifier = "LogoAndNameCollectionViewCell"
    private var collectionView = JobFairCollectionView(frame: CGRect.zero,
                                                       collectionViewLayout: JobFairCollectionViewFlowLayout(minimumInteritemSpacing: 0, minimumLineSpacing: 0))
    private var titleLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        setupTitleLabelConstraints()
        setupCollectionViewConstraints()
    }
    
    private func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: .systemPadding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .systemPadding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.systemPadding)
        ])
    }
    
    private func setupCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .systemPadding),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func configure() {
        collectionView.register(LogoAndNameCollectionViewCell.self, forCellWithReuseIdentifier: logoAndNameCollectionViewCellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        setTitleLabel()
    }
    
    private func setTitleLabel() {
        titleLabel.text = viewModel?.name
        titleLabel.font = .titleMedium
    }
}

extension InfoSocialTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = viewModel?.socialNetworks?[indexPath.row].url {
            infoSocialTableViewCellDelegate.didSelectSocialNetworkWithLink(url)
        }
    }
}

extension InfoSocialTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = cellIsInFirstRow(at: indexPath) ? collectionView.frame.width / 2 : collectionView.frame.width / 3
        let height: CGFloat = 80
        let size = CGSize(width: width - 4, height: height)
        return size
    }
    
    private func cellIsInFirstRow(at indexPath: IndexPath) -> Bool {
        return indexPath.row < 2
    }
}

extension InfoSocialTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.socialNetworks?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let logoAndNameCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: logoAndNameCollectionViewCellIdentifier, for: indexPath)
            as? LogoAndNameCollectionViewCell,
            let socialNetworks = viewModel?.socialNetworks else {
                return UICollectionViewCell()
        }
        
        let socialNetwork = socialNetworks[indexPath.row]
        logoAndNameCollectionViewCell.configure(with: socialNetwork.name, logoImage: socialNetwork.image, logoImageUrl: nil, cellType: .social)
        
        return logoAndNameCollectionViewCell
    }
}
