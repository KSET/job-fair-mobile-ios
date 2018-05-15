import Quick
import Nimble
import RxSwift
@testable import JobFair

class CompanyFilterUseCaseMock: CompanyFilterUseCase {
    var didFetchIndustries = false
    
    override func fetchIndustries(presenter: CompanyFilterPresenter) {
        didFetchIndustries = true
    }
}
