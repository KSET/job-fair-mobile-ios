import Foundation
import DateToolsSwift

struct NewsViewModel: Equatable {
    let id: String
    let title: String
    let content: NSAttributedString
    let thumbnailUrl: URL?
    let imageUrl: URL?
    let publishedAt: String
    let link: URL
}

extension NewsViewModel {
    
    init?(news: News) {
        guard let newsLinkUrl = URL(string: news.link) else {
            return nil
        }
        
        let content = try? NSAttributedString(htmlString: news.content, font: .titleRegular)
        
        id = news.id
        title = news.title
        self.content = content ?? NSAttributedString(string: "")
        thumbnailUrl = URL(string: news.thumbnailUrl ?? "")
        imageUrl = URL(string: news.imageUrl ?? "")
        publishedAt = "\(news.publishedAt.timeAgoSinceNow)"
        link = newsLinkUrl
    }
}
