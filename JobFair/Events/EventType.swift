import Foundation

enum EventType {
    case presentations, workshops

    var title: String {
        switch self {
        case .presentations:
            return "Presentations"
        case .workshops:
            return "Workshops"
        }
    }
}
