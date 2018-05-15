import Quick
import Nimble
import RxSwift
@testable import JobFair

class CompanyGatewayMock: CompanyGateway {
    var didGetIndustries = false
    var didGetCompanies = false
    
    override func fetchCompanies() -> Single<[Company]> {
        didGetCompanies = true
        
        let companies = [
            Company(id: "1", name: "", industry: Industry(id: "1", name: ""), logoUrlString: "", description: "",
                    workshopDate: nil, workshopName: nil, presentationDate: nil, presentationName: nil, cocktailName: "", websiteUrlString: "", boothLocation: ""),
            Company(id: "2", name: "", industry: Industry(id: "2", name: ""), logoUrlString: "", description: "",
                    workshopDate: nil, workshopName: nil, presentationDate: nil, presentationName: nil, cocktailName: "", websiteUrlString: "", boothLocation: ""),
            Company(id: "3", name: "", industry: Industry(id: "3", name: ""), logoUrlString: "", description: "",
                    workshopDate: nil, workshopName: nil, presentationDate: nil, presentationName: nil, cocktailName: "", websiteUrlString: "", boothLocation: ""),
        ]
        
        return Single.just(companies)
    }
    
    override func fetchIndustries() -> Single<[Industry]> {
        didGetIndustries = true
        
        let industries = [
            Industry(id: "0", name: ""),
            Industry(id: "1", name: ""),
            Industry(id: "2", name: "")
        ]
        
        return Single.just(industries)
    }
}
