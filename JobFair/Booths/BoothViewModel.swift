import Foundation
import CoreLocation

struct BoothViewModel {
    let geolocation: CLLocationCoordinate2D
    let company: CompanyViewModel
}

extension BoothViewModel {

    init(booth: Booth) {
        geolocation = CLLocationCoordinate2D(latitude: booth.latitude, longitude: booth.longitude)
        company = CompanyViewModel(company: booth.company)
    }
}
