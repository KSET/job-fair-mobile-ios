import UIKit

struct EventViewModel: Equatable {
    let id: String
    let title: String
    let description: String
    let lecturerImageUrl: URL?
    let lecturerDescription: String?
    let startDate: Date
    let endDate: Date
    let location: String
    let company: CompanyViewModel
    let placeholderImage: UIImage
    let geolocation: Geolocation
    let type: EventType
    let eventTitle: String
    
    var progressIndicatorImage: UIImage? {
        if isInProgress {
            return UIImage(named: "event_in_progress")
        }

        if shouldHideCalendarButton {
            return UIImage(named: "event_past")
        }
        
        return UIImage(named: "event_future")
    }
    
    var isInProgress: Bool {
        return Date().isBetween(startDate, and: endDate)
    }

    var shouldHideCalendarButton: Bool {
        return startDate < Date()
    }

    var startDateString: String {
        return SharedDateFormatter.shared.presentableDate(from: startDate)
    }
    
    var startTimeString: String {
        return SharedDateFormatter.shared.presentableTime(from: startDate)
    }

    var endDateString: String {
        return SharedDateFormatter.shared.presentableString(from: endDate)
    }

    var startToEndDateString: String {
        SharedDateFormatter.shared.dateFormat = " - HH:mm"
        let endTime = SharedDateFormatter.shared.string(from: endDate)
        return startDateString + endTime
    }
    
    var shouldShowRateView: Bool {
        return SessionManager.instance.userRole == .student
    }
}

extension EventViewModel {

    init?(event: Event?) {
        guard let event = event else {
            return nil
        }
        
        id = event.id
        title = event.title
        description = event.description
        location = event.location
        startDate = event.startDate
        endDate = event.endDate
        company = CompanyViewModel(company: event.company)
        geolocation = event.geolocation

        if let event = event as? Presentation {
            lecturerImageUrl = URL(string: event.lecturerImage)
            lecturerDescription = event.lecturerDescription
            placeholderImage = #imageLiteral(resourceName: "presenter_placeholder")
            type = .presentations
            eventTitle = Constants.Companies.presentation
        } else {
            lecturerImageUrl = nil
            lecturerDescription = nil
            placeholderImage = #imageLiteral(resourceName: "placeholder")
            type = .workshops
            eventTitle = Constants.Companies.workshop
        }
    }
}
