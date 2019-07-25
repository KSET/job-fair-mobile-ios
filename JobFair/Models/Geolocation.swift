import Foundation
import CoreLocation

struct Geolocation: Equatable {
    let latitude: Double
    let longitude: Double
    
    var coordinates: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
