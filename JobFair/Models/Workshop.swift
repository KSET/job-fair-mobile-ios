import Foundation

struct Workshop: Event, Equatable {
    let id: String
    let title: String
    let description: String
    let startDate: Date
    let endDate: Date
    let location: String
    let geolocation: Geolocation
    let company: Company
}

extension Workshop {

    init?(queryWorkshop: WorkshopsQuery.Data.Workshop?) {
        guard let queryWorkshop = queryWorkshop else {
            return nil
        }

        id = queryWorkshop.id ?? Constants.Common.defaultId
        title = queryWorkshop.name ?? ""
        description = queryWorkshop.description ?? ""
        location = queryWorkshop.location ?? ""
        company = Company(queryCompany: queryWorkshop.company?.fragments.companyDetails)!
        startDate = SharedDateFormatter.shared.date(from: queryWorkshop.occuresAt!)!
        endDate = SharedDateFormatter.shared.date(from: queryWorkshop.finishesAt!)!
        let latitude = queryWorkshop.geolocation?.split(separator: ",").first
        let longitude = queryWorkshop.geolocation?.split(separator: ",")[1]
        geolocation = Geolocation(latitude: Double(latitude ?? "0")!, longitude: Double(longitude ?? "0")!)
    }
}
