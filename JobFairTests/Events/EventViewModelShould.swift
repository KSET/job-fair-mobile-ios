import Quick
import Nimble
@testable import JobFair

class EventViewModelShould: QuickSpec {

    override func spec() {
        
        describe("init(event)") {
            context("event is presentation") {
                it("should create event view model from presentation") {
                    let presentation = Presentation(id: "321",
                                                    title: "test presentation",
                                                    description: "presentation description",
                                                    lecturerImage: "lecturerImage",
                                                    lecturerDescription: "lecturer description",
                                                    startDate: Date(),
                                                    endDate: Date().addingTimeInterval(321),
                                                    location: "D1",
                                                    company: Company.testInstance)

                    let viewModel = EventViewModel(event: presentation)

                    expect(viewModel?.title) == presentation.title
                    expect(viewModel?.description) == presentation.description
                    expect(viewModel?.lecturerDescription) == presentation.lecturerDescription
                    expect(viewModel?.lecturerImageUrl?.absoluteString) == presentation.lecturerImage
                    expect(viewModel?.location) == presentation.location
                    expect(viewModel?.startDate) == presentation.startDate
                    expect(viewModel?.endDate) == presentation.endDate
                    expect(viewModel?.company.logoUrl?.absoluteString) == presentation.company.logoUrlString
                    expect(viewModel?.startDateString) == SharedDateFormatter.shared.presentableString(from: presentation.startDate)
                    expect(viewModel?.endDateString) == SharedDateFormatter.shared.presentableString(from: presentation.endDate)
                }
            }

            context("event is workshop") {
                it("should create event view model from workshop") {
                    let workshop = Workshop(id: "321",
                                            title: "test presentation",
                                            description: "presentation description",
                                            startDate: Date(),
                                            endDate: Date().addingTimeInterval(321),
                                            location: "D1",
                                            company: Company.testInstance)
                    let viewModel = EventViewModel(event: workshop)

                    expect(viewModel?.title) == workshop.title
                    expect(viewModel?.description) == workshop.description
                    expect(viewModel?.location) == workshop.location
                    expect(viewModel?.startDate) == workshop.startDate
                    expect(viewModel?.endDate) == workshop.endDate
                    expect(viewModel?.company.logoUrl?.absoluteString) == workshop.company.logoUrlString
                    expect(viewModel?.startDateString) == SharedDateFormatter.shared.presentableString(from: workshop.startDate)
                    expect(viewModel?.endDateString) == SharedDateFormatter.shared.presentableString(from: workshop.endDate)
                }
            }
        }
    }
}
