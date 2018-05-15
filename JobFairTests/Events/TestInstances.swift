import Foundation
import EventKit
@testable import JobFair

extension EventViewModel {

    static var testInstance: EventViewModel {
        return EventViewModel(title: "Test presentation",
                         description: "presentation description",
                         lecturerImageUrl: URL(string: "image"),
                         lecturerDescription: "description",
                         startDate: Date(),
                         endDate: Date(),
                         location: "D1",
                         company: CompanyViewModel.testInstance,
                         placeholderImage: #imageLiteral(resourceName: "first"))
    }
}

extension CalendarEvent {

    static var testInstance: CalendarEvent {
        let store = EKEventStore()
        let event = EKEvent(eventStore: store)

        return CalendarEvent(event: event, eventStore: store)
    }
}

extension CompanyViewModel {
    
    static var testInstance: CompanyViewModel {
        return CompanyViewModel(id: "id",
                                name: "name",
                                industry: Industry(id: "id", name: "name"),
                                logoUrl: nil,
                                description: "desc",
                                cocktailName: "coctail",
                                websiteUrlString: "www.web.com",
                                presentationDate: nil,
                                presentationName: "presenation name",
                                workshopDate: nil,
                                workshopName: "workshop name",
                                boothLocation: "")
    }
}

extension Company {

    static var testInstance: Company {
        return Company(id: "id",
                       name: "name",
                       industry: Industry(id: "id", name: "name"),
                       logoUrlString: "www.webimage.com",
                       description: "description",
                       workshopDate: Date(),
                       workshopName: "workshopName",
                       presentationDate: Date().addingTimeInterval(5),
                       presentationName: "presentationName",
                       cocktailName: "cocktail",
                       websiteUrlString: "www.web.com",
                       boothLocation: "")
    }
}
