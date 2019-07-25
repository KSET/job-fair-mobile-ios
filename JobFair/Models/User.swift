import Foundation

enum UserRole: String {
    case student
    case company
}

struct User {
    let email: String
    let name: String
    let firstName: String
    let lastName: String
    let role: UserRole
    let companies: [Company]
    let resumeUid: String
    
    var companyId: String {
        return companies.first?.id ?? ""
    }
    
    var qrCodePayload: String {
        return """
        {
            "first_name": "\(firstName)",
            "last_name": "\(lastName)",
            "resume_uid": "\(resumeUid)"
        }
        """
    }
}

extension User {
    
    init(_ userPayload: LoginQueryMutation.Data.Login.User) {
        email = userPayload.email ?? ""
        name = userPayload.name ?? ""
        firstName = userPayload.firstName ?? ""
        lastName = userPayload.lastName ?? ""
        role = userPayload.companies?.isEmpty == true ? .student : .company
        companies = userPayload.companies?.compactMap { Company(queryCompany: $0?.fragments.companyDetails) } ?? []
        resumeUid = userPayload.resume?.uid ?? ""
    }
    
    init(_ userPayload: CurrentUserQuery.Data.CurrentUser) {
        email = userPayload.email ?? ""
        name = userPayload.name ?? ""
        firstName = userPayload.firstName ?? ""
        lastName = userPayload.lastName ?? ""
        role = userPayload.companies?.isEmpty == true ? .student : .company
        companies = userPayload.companies?.compactMap { Company(queryCompany: $0?.fragments.companyDetails) } ?? []
        resumeUid = userPayload.resume?.uid ?? ""
    }
}
