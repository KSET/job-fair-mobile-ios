import Quick
import Nimble
@testable import JobFair

class WorkshopShould: QuickSpec {

    override func spec() {

        describe("init(queryWorkshop)") {
            it("should create presentation from query presentation") {
                let thumb = WorkshopsQuery.Data.Workshop.Company.Logo.Medium(url: "imageURL")
                let logo = WorkshopsQuery.Data.Workshop.Company.Logo(medium: thumb)
                var company = WorkshopsQuery.Data.Workshop.Company(id: "34", logo: logo)
                company.name = "companyName"
                let queryWorkshop = WorkshopsQuery.Data.Workshop(id: "45",
                                                                 occuresAt: "2018-05-24T13:00:00+02:00",
                                                                 finishesAt: "2018-05-24T13:00:00+05:00",
                                                                 location: "D1",
                                                                 name: "test title",
                                                                 description: "presentation description",
                                                                 company: company)

                let workshop = Workshop(queryWorkshop: queryWorkshop)

                expect(workshop?.title) == queryWorkshop.name
                expect(workshop?.description) == queryWorkshop.description
                expect(workshop?.company.logoUrlString) == queryWorkshop.company?.logo?.medium?.url
                expect(workshop?.location) == queryWorkshop.location
                expect(workshop?.startDate) == SharedDateFormatter.shared.date(from: queryWorkshop.occuresAt!)!
                expect(workshop?.endDate) == SharedDateFormatter.shared.date(from: queryWorkshop.finishesAt!)!
                expect(workshop?.company.name) == queryWorkshop.company?.name
            }
        }
    }
}
