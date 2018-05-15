import Foundation

struct Booth {
    let id: String
    let latitude: Double
    let longitude: Double
    let company: Company
}

extension Booth {

    init?(queryBooth: BoothsQuery.Data.Booth?) {
        guard let queryBooth = queryBooth else {
            return nil
        }

        id = queryBooth.id ?? Constants.Common.defaultId
        company = Company(queryCompany: queryBooth.company?.fragments.companyDetails)!

        if let geoLocationComponents = queryBooth.geolocation?.split(separator: ","),
                geoLocationComponents.count > 1 {
            latitude = Double(String(geoLocationComponents[0])) ?? 0
            longitude = Double(String(geoLocationComponents[1].trimmingCharacters(in: .whitespaces))) ?? 0
        } else {
            latitude = 0
            longitude = 0
        }
    }
}
