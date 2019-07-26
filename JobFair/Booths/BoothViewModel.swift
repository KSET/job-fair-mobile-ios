import Foundation

struct BoothViewModel {
    let geolocation: Geolocation
    let company: CompanyViewModel
}

extension BoothViewModel {

    init(booth: Booth) {
        geolocation = Geolocation(latitude: booth.latitude, longitude: booth.longitude)
        company = CompanyViewModel(company: booth.company)
    }
}
