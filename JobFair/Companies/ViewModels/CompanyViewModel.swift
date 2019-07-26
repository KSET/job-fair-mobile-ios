import Foundation

struct CompanyViewModel: Equatable {
    let id: String
    let name: String
    let industry: Industry
    let logoUrl: URL?
    let description: String
    let cocktailName: String?
    let websiteUrlString: String
    let presentationDate: Date?
    let presentationName: String?
    let workshopDate: Date?
    let workshopName: String?
    let boothLocation: String
    
    var companyDetails: [CompanyDetail] {
        var details = [
            CompanyDetail(name: Constants.Companies.description, value: description),
            CompanyDetail(name: Constants.Companies.industry, value: industry.name)
        ]
        
        if let presentationTime = presentationTime,
            let presentationName = presentationName {
            details.append(CompanyDetail(name: Constants.Companies.presentation, value: presentationName + " - " + presentationTime))
        }
        
        if let workshopTime = workshopTime,
            let workshopName = workshopName {
            details.append(CompanyDetail(name: Constants.Companies.workshop, value: workshopName + " - " + workshopTime))
        }
        
        if let cocktailName = cocktailName {
            details.append(CompanyDetail(name: Constants.Companies.cocktailName, value: cocktailName))
        }
        
        return details
    }
    
    var workshopTime: String? {
        var time: String?
        
        if let workshopDate = workshopDate {
            time = SharedDateFormatter.shared.presentableString(from: workshopDate)
        }
        
        return time
    }
    
    var presentationTime: String? {
        var time: String?
        
        if let presentationDate = presentationDate {
            time = SharedDateFormatter.shared.presentableString(from: presentationDate)
        }
        
        return time
    }
}

extension CompanyViewModel {
    
    init(company: Company) {        
        id = company.id
        name = company.name
        industry = company.industry
        logoUrl = URL(string: company.logoUrlString)
        description = company.description
        cocktailName = company.cocktailName
        websiteUrlString = company.websiteUrlString
        presentationDate = company.presentationDate
        workshopDate = company.workshopDate
        boothLocation = company.boothLocation
        presentationName = company.presentationName
        workshopName = company.workshopName
    }
}
