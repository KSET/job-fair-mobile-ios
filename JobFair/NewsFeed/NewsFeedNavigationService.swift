import Foundation
import UIKit

class NewsFeedNavigationService: BaseNavigationService {
    
    func navigateToNewsDetails(with newsItems: [NewsViewModel], selectedIndex: Int) {
        let newsDetailsPagerViewController = NewsDetailPagerViewController(news: newsItems, selectedIndex: selectedIndex)
        let jobFairPager = JobFairPageViewController(pager: newsDetailsPagerViewController)
        jobFairPager.title = Constants.News.title
        navigationController?.pushViewController(jobFairPager, animated: true)
    }
    
    func presentShareModal(with newsItem: NewsViewModel) {
        let activityVC = UIActivityViewController(activityItems: [newsItem.link], applicationActivities: nil)
        navigationController?.present(activityVC, animated: true, completion: nil)
    }
}
