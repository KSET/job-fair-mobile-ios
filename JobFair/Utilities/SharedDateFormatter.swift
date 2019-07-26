import Foundation

class SharedDateFormatter: DateFormatter {

    static let shared = SharedDateFormatter()

    private override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func presentableString(from date: Date) -> String {
        dateFormat = "dd.MM. HH:mm"
        return super.string(from: date)
    }
    
    func presentableDate(from date: Date) -> String {
        dateFormat = "MMM d, yyyy"
        return super.string(from: date)
    }
    
    func presentableTime(from date: Date) -> String {
        dateFormat = "HH:mm"
        return super.string(from: date)
    }

    override func date(from string: String) -> Date? {
        dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return super.date(from: string)
    }
}
