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

    private func sort(events: [Event]) -> SortedEvents {
        let sortedEvents = events.sorted { $0.startDate < $1.startDate }

        guard let startingDate = sortedEvents.first?.startDate,
            let secondDay = Calendar.current.date(byAdding: .day, value: 1, to: startingDate) else {
                return SortedEvents(firstDayEvents: [], secondDayEvents: [], highlightedEvent: nil)
        }

        let firstDayEvents = sortedEvents.filter { Calendar.current.isDate(startingDate, inSameDayAs: $0.startDate) }
        let secondDayEvents = sortedEvents.filter { Calendar.current.isDate(secondDay, inSameDayAs: $0.startDate) }
        let highlightedEvents = sortedEvents.first { Date().isBetween($0.startDate, and: $0.endDate) }

        return SortedEvents(firstDayEvents: firstDayEvents, secondDayEvents: secondDayEvents, highlightedEvent: highlightedEvents)
    }
}
