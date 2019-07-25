import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupSession()
        configureFrameworks()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.tintColor = .brandColor
        window?.backgroundColor = .brandColor
        
        window?.rootViewController = RootViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func setupSession() {
        SessionManager.setup()
    }

    private func configureFrameworks() {
        GMSServices.provideAPIKey(Config.googleMapsAPIKey!)
    }
}
