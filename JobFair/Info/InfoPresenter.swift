import Foundation

class InfoPresenter {
    
    unowned var viewController: InfoViewController
    private let socialNetworks: [SocialNetworkViewModel] = [
        SocialNetworkViewModel(name: Constants.Social.webName, urlString: Constants.Social.webUrl, image: #imageLiteral(resourceName: "web")),
        SocialNetworkViewModel(name: Constants.Social.emailName, urlString: Constants.Social.emailUrl, image: #imageLiteral(resourceName: "email")),
        SocialNetworkViewModel(name: Constants.Social.facebookName, urlString: Constants.Social.facebookUrl, image: #imageLiteral(resourceName: "facebook")),
        SocialNetworkViewModel(name: Constants.Social.instagramName, urlString: Constants.Social.instagramUrl, image: #imageLiteral(resourceName: "instagram")),
        SocialNetworkViewModel(name: Constants.Social.youtubeName, urlString: Constants.Social.youtubeUrl, image: #imageLiteral(resourceName: "youtube"))
    ]
    
    init(viewController: InfoViewController) {
        self.viewController = viewController
    }
    
    func showInfo() {
        let info = [
            InfoViewModel(name: Constants.Social.dateName,
                          description: Constants.Social.dateDescription,
                          isSelectable: false,
                          socialNetworks: nil),
            InfoViewModel(name: Constants.Social.timeName,
                          description: Constants.Social.timeDescription,
                          isSelectable: false,
                          socialNetworks: nil),
            InfoViewModel(name: Constants.Stream.title,
                          description: nil,
                          isSelectable: false,
                          socialNetworks: nil),
            InfoViewModel(name: Constants.Social.socialName,
                          description: nil,
                          isSelectable: false,
                          socialNetworks: socialNetworks),
            InfoViewModel(name: Constants.Social.descriptionName,
                          description: Constants.Social.description,
                          isSelectable: false,
                          socialNetworks: nil),
            InfoViewModel(name: Constants.Social.locationName,
                          description: Constants.Social.locationDescription,
                          isSelectable: true,
                          socialNetworks: nil)
        ]
        
        viewController.info = info
    }
}
