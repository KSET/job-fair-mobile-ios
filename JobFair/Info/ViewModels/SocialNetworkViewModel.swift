import UIKit

struct SocialNetworkViewModel {
    let name: String
    let url: URL
    let image: UIImage
    
    init(name: String, urlString: String, image: UIImage) {
        self.name = name
        self.url = URL(string: urlString)!
        self.image = image
    }
}
