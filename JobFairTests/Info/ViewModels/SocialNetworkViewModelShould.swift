import Quick
import Nimble
@testable import JobFair

class SocialNetworkViewModelShould: QuickSpec {
    
    override func spec() {
        describe("init(name: String, urlString: String, image: UIImage)") {
            it("should create socialNetwork view model from name, urlString and image") {
                let name = "test name"
                let urlString = "https://undabot.com/"
                let image = #imageLiteral(resourceName: "undabot_logo")
                
                let viewModel = SocialNetworkViewModel(name: name, urlString: urlString, image: image)
                
                expect(viewModel.name) == "test name"
                expect(viewModel.url) == URL(string: "https://undabot.com/")!
                expect(viewModel.image) == #imageLiteral(resourceName: "undabot_logo")
            }
        }
    }
}

