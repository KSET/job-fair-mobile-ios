import Foundation
import FeedKit

struct News {
    let id: String
    let title: String
    let content: String
    let thumbnailUrl: String?
    let imageUrl: String?
    let publishedAt: Date
    let user: Any?
    let link: String
}

extension News {
    
    init(feedItem: RSSFeedItem) {
        id = feedItem.guid?.value ?? ""
        title = feedItem.title ?? ""
        content = feedItem.description ?? ""
        thumbnailUrl = feedItem.media?.mediaThumbnails?.first?.attributes?.url
        imageUrl = feedItem.media?.mediaContents?.first?.attributes?.url
        publishedAt = feedItem.pubDate ?? Date()
        user = feedItem.author
        link = feedItem.link ?? ""
    }
}
