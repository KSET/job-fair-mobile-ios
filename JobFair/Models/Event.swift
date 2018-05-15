import Foundation

protocol Event {
    var id: String { get }
    var title: String { get }
    var description: String { get }
    var startDate: Date { get }
    var endDate: Date { get }
    var location: String { get }
    var company: Company { get }
}
