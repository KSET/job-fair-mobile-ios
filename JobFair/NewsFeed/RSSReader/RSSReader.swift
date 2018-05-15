import Foundation
import FeedKit
import RxSwift

protocol RSSFeed {
    func fetchNews() -> Single<[News]>
}

class RSSReader: RSSFeed {
    private var feedParser: FeedParser? {
        return FeedParser(URL: Config.URLs.apiNewsFeed)
    }
    
    func fetchNews() -> Single<[News]> {
        return Single<[News]>.create { [weak self] (event) -> Disposable in
            let result = self?.feedParser?.parse()
            if let error = result?.error {
                event(.error(error))
            } else if let response = result?.rssFeed?.items {
                let news = response.compactMap { News(feedItem: $0) }
                event(.success(news))
            }
            
            return Disposables.create()
        }
    }
}
