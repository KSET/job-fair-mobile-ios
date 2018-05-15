@testable import JobFair
import Foundation
import RxSwift

class EventGatewayMock: EventGateway {

    var didReturnPresentations = false
    var didReturnWorkshops = false
    var shouldShowError = false

    lazy var firstDayPresentations: [Presentation] = {
        let firstPresentation = Presentation(id: "5",
                                             title: "first event",
                                             description: "desc",
                                             lecturerImage: "image",
                                             lecturerDescription: "decs",
                                             startDate: Date(),
                                             endDate: Date().addingTimeInterval(50),
                                             location: "location",
                                             company: Company.testInstance)
        let secondPresentation = Presentation(id: "2",
                                              title: "second event",
                                              description: "desc",
                                              lecturerImage: "image",
                                              lecturerDescription: "decs",
                                              startDate: Date().addingTimeInterval(500),
                                              endDate: Date().addingTimeInterval(500),
                                              location: "location",
                                              company: Company.testInstance)

        return [firstPresentation, secondPresentation]
    }()

    lazy var secondDayPresentations: [Presentation] = {
        let tommorow = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        let firstPresentation = Presentation(id: "1",
                                             title: "first event",
                                             description: "desc",
                                             lecturerImage: "image",
                                             lecturerDescription: "decs",
                                             startDate: tommorow,
                                             endDate: tommorow,
                                             location: "location",
                                             company: Company.testInstance)
        let secondPresentation = Presentation(id: "7",
                                              title: "second event",
                                              description: "desc",
                                              lecturerImage: "image",
                                              lecturerDescription: "decs",
                                              startDate: tommorow.addingTimeInterval(50),
                                              endDate: tommorow.addingTimeInterval(50),
                                              location: "location",
                                              company: Company.testInstance)
        return [firstPresentation, secondPresentation]
    }()

    lazy var firstDayWorkshops: [Workshop] = {
        let firstWorkshop = Workshop(id: "5",
                                     title: "first event",
                                     description: "desc",
                                     startDate: Date(),
                                     endDate: Date().addingTimeInterval(50),
                                     location: "location",
                                     company: Company.testInstance)
        let secondWorkshop = Workshop(id: "2",
                                      title: "second event",
                                      description: "desc",
                                      startDate: Date().addingTimeInterval(500),
                                      endDate: Date().addingTimeInterval(500),
                                      location: "location",
                                      company: Company.testInstance)

        return [firstWorkshop, secondWorkshop]
    }()

    lazy var secondDayWorkshops: [Workshop] = {
        let tommorow = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        let firstWorkshop = Workshop(id: "1",
                                     title: "first event",
                                     description: "desc",
                                     startDate: tommorow,
                                     endDate: tommorow,
                                     location: "location",
                                     company: Company.testInstance)
        let secondWorkshop = Workshop(id: "7",
                                      title: "second event",
                                      description: "desc",
                                      startDate: tommorow.addingTimeInterval(50),
                                      endDate: tommorow.addingTimeInterval(50),
                                      location: "location",
                                      company: Company.testInstance)
        return [firstWorkshop, secondWorkshop]
    }()

    override func fetchPresentations() -> Single<[Presentation]> {
        if shouldShowError {
            return Single.error(TestErrors.fakeError)
        }
        didReturnPresentations = true

        var combinedPresentations = firstDayPresentations + secondDayPresentations
        combinedPresentations.sort { $0.id > $1.id }
        return Single.just(combinedPresentations)
    }

    override func fetchWorkshops() -> Single<[Workshop]> {
        if shouldShowError {
            return Single.error(TestErrors.fakeError)
        }
        didReturnWorkshops = true

        var combinedWorkshops = firstDayWorkshops + secondDayWorkshops
        combinedWorkshops.sort { $0.id > $1.id }
        return Single.just(combinedWorkshops)
    }
}
