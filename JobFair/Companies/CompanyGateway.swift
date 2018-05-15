import Foundation
import RxSwift
import Apollo

class CompanyGateway {
    
    let apiClient: APIClient
    
    init(apiClient: APIClient = ApolloClient(url: Config.URLs.apiBase)) {
        self.apiClient = apiClient
    }
    
    func fetchCompanies() -> Single<[Company]> {
        return Single<[Company]>.create { [unowned self] single -> Disposable in
            self.apiClient.fetch(query: CompaniesQuery()) { (result, error) in
                if let error = error {
                    single(.error(error))
                } else if let queryCompanies = result?.data?.companies {
                    let companies = queryCompanies.compactMap { Company(queryCompany: $0?.fragments.companyDetails) }
                    single(.success(companies))
                }
            }
            
            return Disposables.create()
        }
    }

    func fetchIndustries() -> Single<[Industry]> {
        return Single<[Industry]>.create { [unowned self] single -> Disposable in
            self.apiClient.fetch(query: IndustriesQuery()) { (result, error) in
                if let error = error {
                    single(.error(error))
                } else if let queryIndustries = result?.data?.industries {
                    let industries = queryIndustries.compactMap { Industry(queryIndustry: $0) }
                    single(.success(industries))
                }
            }
            
            return Disposables.create()
        }
    }
}
