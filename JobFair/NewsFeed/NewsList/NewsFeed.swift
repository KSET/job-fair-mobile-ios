import Foundation
import RxSwift

class NewsFeed {
    var rssReader: RSSFeed = RSSReader()
    private let disposeBag = DisposeBag()
    
    func showNewsList(in presenter: NewsListPresenter) {
        rssReader.fetchNews()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe { (event) in
            switch event {
            case .success(let newsList):
                presenter.show(newsList: newsList)
            case .error:
                presenter.showError()
            }
        }
        .disposed(by: disposeBag)
    }
}
