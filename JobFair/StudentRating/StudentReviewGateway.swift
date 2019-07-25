import Foundation
import RxSwift
import Apollo

enum JobFairError: Error {
    case noUser
    case noData
}

class StudentReviewGateway {
    
    func submitStudentReview(_ studentReview: StudentReviewInfo) -> Single<Void> {
        guard let user = SessionManager.instance.user else {
            return .error(JobFairError.noUser)
        }
        
        let input = CompanyResumeReviewInput(clientMutationId: nil,
                                             companyMemberId: user.companyId,
                                             resumeUid: studentReview.resumeUid,
                                             notes: studentReview.notes,
                                             followup: nil,
                                             social: studentReview.socialSkills,
                                             ambition: studentReview.ambition,
                                             skill: studentReview.technicalSkills)
        
        return Single<Void>.create(subscribe: { single -> Disposable in
            NetworkClient.shared.apollo.perform(mutation: StudentReviewMutation(input: input)) { (result, error) in
                if let error = error {
                    single(.error(error))
                } else if result?.data != nil {
                    single(.success(()))
                } else {
                    single(.error(JobFairError.noData))
                }
            }
            
            return Disposables.create()
        })
    }
}
