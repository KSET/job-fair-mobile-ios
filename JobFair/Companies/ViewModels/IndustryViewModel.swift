import Foundation

struct IndustryViewModel {
    var id: String
    var name: String
}

extension IndustryViewModel {
    
    init(industry: Industry) {
        self.id = industry.id
        self.name = industry.name
    }
}
