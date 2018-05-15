import RxSwift
@testable import JobFair

class RSSReaderMock: RSSFeed {
    var shouldReturnError = false
    
    func fetchNews() -> Single<[News]> {
        return Single.create(subscribe: { [unowned self] (event) -> Disposable in
            if self.shouldReturnError {
                let error = NSError()
                event(.error(error))
            } else {
                let news = News(id: "1", title: "1", content: "1", thumbnailUrl: "www.test.com", imageUrl: "www.test.com", publishedAt: Date(), user: nil, link: "www.test.com")
                event(.success([news]))
            }
            
            return Disposables.create()
        })
    }
}
