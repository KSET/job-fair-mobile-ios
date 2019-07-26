import UIKit

class InfoPresenter {
    
    unowned var viewController: InfoViewController
    private let socialNetworks: [SocialNetworkViewModel] = [
        SocialNetworkViewModel(name: Constants.Social.emailName, urlString: Constants.Social.emailUrl, image: #imageLiteral(resourceName: "email")),
        SocialNetworkViewModel(name: Constants.Social.instagramName, urlString: Constants.Social.instagramUrl, image: #imageLiteral(resourceName: "instagram")),
        SocialNetworkViewModel(name: Constants.Social.facebookName, urlString: Constants.Social.facebookUrl, image: #imageLiteral(resourceName: "facebook")),
        SocialNetworkViewModel(name: Constants.Social.webName, urlString: Constants.Social.webUrl, image: #imageLiteral(resourceName: "web")),
        SocialNetworkViewModel(name: Constants.Social.youtubeName, urlString: Constants.Social.youtubeUrl, image: #imageLiteral(resourceName: "youtube"))
    ]
    
    init(viewController: InfoViewController) {
        self.viewController = viewController
    }
    
    func showInfo() {
        let info = [
            InfoViewModel(name: Constants.Stream.title,
                          description: nil,
                          isSelectable: false,
                          socialNetworks: nil),
            InfoViewModel(name: Constants.Social.dateName.uppercased(),
                          description: NSAttributedString(string: Constants.Social.dateDescription),
                          isSelectable: false,
                          socialNetworks: nil),
            InfoViewModel(name: Constants.Social.timeName.uppercased(),
                          description: timeDescription,
                          isSelectable: false,
                          socialNetworks: nil),
            InfoViewModel(name: Constants.Social.descriptionName.uppercased(),
                          description: NSAttributedString(string: Constants.Social.description),
                          isSelectable: false,
                          socialNetworks: nil),
            InfoViewModel(name: Constants.Social.locationName.uppercased(),
                          description: NSAttributedString(string: Constants.Social.locationDescription),
                          isSelectable: true,
                          socialNetworks: nil),
            InfoViewModel(name: Constants.Social.socialName.uppercased(),
                          description: nil,
                          isSelectable: false,
                          socialNetworks: socialNetworks)
        ]
        
        viewController.info = info
    }
    
    private var timeDescription: NSAttributedString {
        let timeDescription = NSMutableAttributedString(string: Constants.Social.timeDescription)
        let timeDescriptionNSString = timeDescription.string as NSString
        let attributes = [ NSAttributedStringKey.font: UIFont.contentBold ]
        
        timeDescription.addAttributes(attributes, range: timeDescriptionNSString.range(of: Constants.Social.boothsTime))
        timeDescription.addAttributes(attributes, range: timeDescriptionNSString.range(of: Constants.Social.wednesdayPresentationTime))
        timeDescription.addAttributes(attributes, range: timeDescriptionNSString.range(of: Constants.Social.thursdayPresentationTime))
        timeDescription.addAttributes(attributes, range: timeDescriptionNSString.range(of: Constants.Social.wednesdayWorkshopTime))
        timeDescription.addAttributes(attributes, range: timeDescriptionNSString.range(of: Constants.Social.thursdayWorkshopTime))
        timeDescription.addAttributes(attributes, range: timeDescriptionNSString.range(of: Constants.Social.partyTime))

        return timeDescription
    }
}
