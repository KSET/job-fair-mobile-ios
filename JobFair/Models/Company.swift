import Foundation

struct Company: Equatable {
    let id: String
    let name: String
    let industry: Industry
    let logoUrlString: String
    let description: String
    let workshopDate: Date?
    let workshopName: String?
    let presentationDate: Date?
    let presentationName: String?
    let cocktailName: String?
    let websiteUrlString: String
    let boothLocation: String
}

extension Company {
    
    init?(queryCompany: CompanyDetails?) {
        guard let queryCompany = queryCompany else {
            return nil
        }
        
        id = queryCompany.id ?? ""
        name = queryCompany.name ?? ""
        logoUrlString = queryCompany.logo?.medium?.url ?? ""
        description = queryCompany.shortDescription ?? ""
        cocktailName = queryCompany.cocktail?.name
        websiteUrlString = queryCompany.homepageUrl ?? ""
        boothLocation = queryCompany.booth?.location ?? ""
        
        if let industry = queryCompany.industry,
            let industryId = industry.id,
            let industryName = industry.name {
            self.industry = Industry(id: industryId, name: industryName)
        } else {
            self.industry = Industry(id: "", name: "")
        }
        
        if let workshop = queryCompany.workshop,
            let workshopTime = workshop.occuresAt,
            let workshopDate = SharedDateFormatter.shared.date(from: workshopTime) {
            self.workshopDate = workshopDate
            workshopName = workshop.name
        } else {
            workshopDate = nil
            workshopName = nil
        }
        
        if let presentation = queryCompany.presentation,
            let presentationTime = presentation.occuresAt,
            let presentationDate = SharedDateFormatter.shared.date(from: presentationTime) {
            self.presentationDate = presentationDate
            presentationName = presentation.title
        } else {
            presentationDate = nil
            presentationName = nil
        }
    }
}
