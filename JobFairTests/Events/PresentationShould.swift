import Quick
import Nimble
@testable import JobFair

class PresentationShould: QuickSpec {

    override func spec() {

        describe("init(queryPresentation)") {
            it("should create presentation from query presentation") {
                let presenterThumb = PresentationsQuery.Data.Presentation.PresenterPhoto.Medium(url: "imageURL")
                let presenterPhoto = PresentationsQuery.Data.Presentation.PresenterPhoto(medium: presenterThumb)
                let thumb = PresentationsQuery.Data.Presentation.Company.Logo.Medium(url: "imageURL")
                let logo = PresentationsQuery.Data.Presentation.Company.Logo(medium: thumb)
                var company = PresentationsQuery.Data.Presentation.Company(id: "34", logo: logo)
                company.name = "companyName"
                let queryPresentation = PresentationsQuery.Data.Presentation(id: "45",
                                                                             occuresAt: "2018-05-24T13:00:00+02:00",
                                                                             finishesAt: "2018-05-24T13:00:00+05:00",
                                                                             location: "D1",
                                                                             description: "presentation description",
                                                                             presenterBio: "presenter bio",
                                                                             title: "test title",
                                                                             presenterPhoto: presenterPhoto,
                                                                             company: company)

                let presentation = Presentation(queryPresentation: queryPresentation)

                expect(presentation?.title) == queryPresentation.title
                expect(presentation?.description) == queryPresentation.description
                expect(presentation?.lecturerDescription) == queryPresentation.presenterBio
                expect(presentation?.company.logoUrlString) == queryPresentation.company?.logo?.medium?.url
                expect(presentation?.lecturerImage) == queryPresentation.presenterPhoto?.medium?.url
                expect(presentation?.location) == queryPresentation.location
                expect(presentation?.startDate) == SharedDateFormatter.shared.date(from: queryPresentation.occuresAt!)!
                expect(presentation?.endDate) == SharedDateFormatter.shared.date(from: queryPresentation.finishesAt!)!
                expect(presentation?.company.name) == queryPresentation.company?.name
            }
        }
    }
}
