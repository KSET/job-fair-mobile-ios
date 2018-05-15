import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        application.statusBarStyle = .lightContent
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.tintColor = .brandColor
        window?.backgroundColor = .brandColor
        window?.rootViewController = RootViewController()
        window?.makeKeyAndVisible()
        configureFrameworks()
        
        return true
    }

    private func configureFrameworks() {
        GMSServices.provideAPIKey(Config.googleMapsAPIKey!)
    }
}
