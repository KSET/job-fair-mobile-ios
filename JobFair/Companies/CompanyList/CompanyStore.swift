import Foundation
import RxSwift

class CompanyStore {
    private let companyGateway: CompanyGateway
    private let disposeBag = DisposeBag()
    
    init(gateway: CompanyGateway = CompanyGateway()) {
        self.companyGateway = gateway
    }
    
    func showCompanies(for industryId: String, presenter: CompanyListPresenter) {
        presenter.showLoadingView()
        companyGateway.fetchCompanies()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] companies in
            let filteredCompanies = self?.getFilteredCompanies(for: industryId, companies)
            presenter.showCompanies(filteredCompanies, industryId: industryId)
            presenter.removeLoadingView()
        }, onError: { _ in
            presenter.showError()
            presenter.removeLoadingView()
        })
        .disposed(by: disposeBag)
    }
    
    func getFilteredCompanies(for industryId: String, _ companies: [Company]) -> [Company] {
        let filteredCompanies = shouldShowAllIndustries(for: industryId) ? companies : companies.filter { $0.industry.id == industryId }
        return filteredCompanies
    }
    
    private func shouldShowAllIndustries(for industryId: String) -> Bool {
        return industryId == Constants.Common.defaultId
    }
}
