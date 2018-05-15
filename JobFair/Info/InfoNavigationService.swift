import UIKit

class InfoNavigationService: BaseNavigationService {
    
    func openUndabotWebsite() {
        open(Config.URLs.undabotWeb)
    }
    
    func openDayOneStream() {
        open(Config.Stream.dayOne)
    }
    
    func openDayTwoStream() {
        open(Config.Stream.dayTwo)
    }
    
    func shareWebsite() {
        let activityViewController = UIActivityViewController(
            activityItems: [Config.URLs.website],
            applicationActivities: nil)
        navigationController?.present(activityViewController, animated: true)
    }
    
    func openGoogleMaps() {
        open(Config.URLs.googleMaps)
    }
}
