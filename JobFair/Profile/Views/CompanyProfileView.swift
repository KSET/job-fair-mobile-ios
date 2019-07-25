import UIKit

class CompanyProfileView: UITableView {
    
    private let companies: [Company]
    private let cellIdentifier = "cellIdentifier"
    
    init(companies: [Company]) {
        self.companies = companies
        super.init(frame: .zero, style: .plain)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        separatorStyle = .none
        tableFooterView = UIView()
        dataSource = self
        register(CompanyAccountCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

extension CompanyProfileView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        if let cell = cell as? CompanyAccountCell {
            let company = companies[indexPath.row]
            cell.nameLabel.text = company.name
            cell.logoImageView.kf.setImage(with: URL(string: company.logoUrlString))
        }
        
        return cell
    }
}
