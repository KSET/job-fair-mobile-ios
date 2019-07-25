import Foundation
import RxSwift

class EventStore {

    private let gateway: EventGateway
    private let disposeBag = DisposeBag()

    init(gateway: EventGateway = EventGateway()) {
        self.gateway = gateway
    }

    func showPresentations(with presenter: EventPresenter) {
       gateway.fetchPresentations()
        .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
        .observeOn(MainScheduler.instance)
        .subscribe { [unowned self] event in
            switch event {
            case .success(let presentations):
                let sortedPresentations = self.sort(events: presentations)
                presenter.show(events: sortedPresentations)
            case .error:
                presenter.showError()
            }
        }
        .disposed(by: disposeBag)
    }

    func showWorkshops(with presenter: EventPresenter) {
        gateway.fetchWorkshops()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe { [unowned self] event in
            switch event {
            case .success(let workshops):
                let sortedWorkshops = self.sort(events: workshops)
                presenter.show(events: sortedWorkshops)
            case .error:
                presenter.showError()
            }
        }
        .disposed(by: disposeBag)
    }
    
    func rateEvent(eventType: EventType, eventId: String, rating: Double) {
        let workshopId = eventType == .workshops ? eventId : nil
        let presentationId = eventType == .presentations ? eventId : nil
        gateway.rateEvent(workshopId: workshopId, presentationId: presentationId, rating: Int(rating))
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe()
            .disposed(by: disposeBag)
    }

    private func sort(events: [Event]) -> SortedEvents {
        let sortedEvents = events.sorted { $0.startDate < $1.startDate }

        guard let startingDate = sortedEvents.first?.startDate else {
            return SortedEvents(firstDayEvents: [], secondDayEvents: [])
        }

        let firstDayEvents = sortedEvents.filter { Calendar.current.isDate(startingDate, inSameDayAs: $0.startDate) }
        let secondDayEvents =  sortedEvents.filter { !Calendar.current.isDate(startingDate, inSameDayAs: $0.startDate) }

        return SortedEvents(firstDayEvents: firstDayEvents, secondDayEvents: secondDayEvents)
    }
}
