import Quick
import Nimble
@testable import JobFair

class InfoNavigationServiceMock: InfoNavigationService {
    var didOpenURL = false
    var didDismiss = false
    var didShareWebsite = false
    var didOpenDayOneStream = false
    var didOpenDayTwoStream = false
    
    override func open(_ url: URL) {
        didOpenURL = true
    }
    
    override func dismiss() {
        didDismiss = true
    }
    
    override func shareWebsite() {
        didShareWebsite = true
    }
    
    override func openDayOneStream() {
        didOpenDayOneStream = true
    }
    
    override func openDayTwoStream() {
        didOpenDayTwoStream = true
    }
}
