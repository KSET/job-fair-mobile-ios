import Foundation

struct Presentation: Event, Equatable {
    let id: String
    let title: String
    let description: String
    let lecturerImage: String
    let lecturerDescription: String
    let startDate: Date
    let endDate: Date
    let location: String
    let geolocation: Geolocation
    let company: Company
}

extension Presentation {

    init?(queryPresentation: PresentationsQuery.Data.Presentation?) {
        guard let queryPresentation = queryPresentation else {
            return nil
        }

        id = queryPresentation.id ?? Constants.Common.defaultId
        title = queryPresentation.title ?? ""
        description = queryPresentation.description ?? ""
        lecturerImage = queryPresentation.presenterPhoto?.medium?.url ?? ""
        lecturerDescription = queryPresentation.presenterBio ?? ""
        location = queryPresentation.location ?? ""
        company = Company(queryCompany: queryPresentation.company?.fragments.companyDetails)!
        startDate = SharedDateFormatter.shared.date(from: queryPresentation.occuresAt!)!
        endDate = SharedDateFormatter.shared.date(from: queryPresentation.finishesAt!)!
        let geoLocationComponents = queryPresentation.geolocation?.split(separator: ",")
        let latitude = geoLocationComponents?.first
        let longitude = geoLocationComponents?[1]
        geolocation = Geolocation(latitude: Double(latitude ?? "0")!, longitude: Double(longitude ?? "0")!)
    }
}
