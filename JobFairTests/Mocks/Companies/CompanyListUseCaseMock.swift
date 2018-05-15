import Quick
import Nimble
@testable import JobFair

class CompanyStoreMock: CompanyStore {
    var didFetchCompanies = false
    
    override func showCompanies(for industryId: String, presenter: CompanyListPresenter) {
        didFetchCompanies = true
    }
}
