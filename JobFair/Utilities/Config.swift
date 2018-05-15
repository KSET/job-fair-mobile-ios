import UIKit

struct Config {
    struct URLs {
        static let apiNewsFeed = URL(string: "https://jobfair.fer.unizg.hr/en/feed?format=rss")!
        static let website = URL(string: "https://jobfair.fer.unizg.hr/")!
        static let undabotWeb = URL(string: "https://undabot.com/")!
        static let googleMaps = URL(string: "https://www.google.com/maps/@45.8011031,15.9710031,17.5z")!
        
        static var apiBase: URL {
            #if DEBUG
            return URL(string: "https://jobfair-staging.kset.org/api/v2/graphql")!
            #else
            return URL(string: "https://jobfair.fer.unizg.hr/api/v2/graphql")!
            #endif
        }
    }
    
    struct Stream {
        static let dayOne = URL(string: "https://www.youtube.com/watch?v=cfqAkg5lhGg")!
        static let dayTwo = URL(string: "https://www.youtube.com/watch?v=gTiUkm5qHU0")!
    }

    static var googleMapsAPIKey: String? {
        var resourcePath: String
        #if DEBUG
        resourcePath = "GoogleService-Info-Test"
        #else
        resourcePath = "GoogleService-Info"
        #endif

        if let googleServiceInfoPath = Bundle.main.path(forResource: resourcePath, ofType: "plist"),
            let plistDictionary = NSDictionary(contentsOfFile: googleServiceInfoPath) {
                return plistDictionary["GOOGLE_MAPS_API_KEY"] as? String
        }

        return ""
    }
}
