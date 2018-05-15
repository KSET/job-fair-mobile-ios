import Foundation
import UIKit

struct EventViewModel: Equatable {
    let title: String
    let description: String
    let lecturerImageUrl: URL?
    let lecturerDescription: String?
    let startDate: Date
    let endDate: Date
    let location: String
    let company: CompanyViewModel
    let placeholderImage: UIImage

    var shouldHideCalendarButton: Bool {
        return startDate.compare(Date()) == .orderedAscending
    }

    var startDateString: String {
        return SharedDateFormatter.shared.presentableString(from: startDate)
    }

    var endDateString: String {
        return SharedDateFormatter.shared.presentableString(from: endDate)
    }

    var startToEndDateString: String {
        SharedDateFormatter.shared.dateFormat = " - HH:mm"
        let endTime = SharedDateFormatter.shared.string(from: endDate)
        return startDateString + endTime
    }
}

extension EventViewModel {

    init?(event: Event?) {
        guard let event = event else {
            return nil
        }
        
        title = event.title
        description = event.description
        location = event.location
        startDate = event.startDate
        endDate = event.endDate
        company = CompanyViewModel(company: event.company)

        if let event = event as? Presentation {
            lecturerImageUrl = URL(string: event.lecturerImage)
            lecturerDescription = event.lecturerDescription
            placeholderImage = #imageLiteral(resourceName: "presenter_placeholder")
        } else {
            lecturerImageUrl = nil
            lecturerDescription = nil
            placeholderImage = #imageLiteral(resourceName: "placeholder")
        }
    }
}
