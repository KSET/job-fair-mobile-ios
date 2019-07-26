import Foundation

struct StudentInfo: Codable {
    let firstName: String
    let lastName: String
    let resumeUid: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case resumeUid = "resume_uid"
    }
}
