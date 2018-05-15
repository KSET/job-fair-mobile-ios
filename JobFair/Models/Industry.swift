import Foundation

struct Industry: Equatable {
    var id: String
    var name: String
}

extension Industry {
    
    init?(queryIndustry: IndustriesQuery.Data.Industry?) {
        guard let queryIndustry = queryIndustry else {
            return nil
        }
        
        id = queryIndustry.id ?? ""
        name = queryIndustry.name ?? ""
    }
}
