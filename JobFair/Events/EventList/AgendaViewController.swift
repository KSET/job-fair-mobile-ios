import UIKit
import XLPagerTabStrip

class AgendaViewController: XLPagerViewController {
    
    private lazy var firstDayViewController = EventsViewController(eventType: .workshops,
                                                                   navigationController: navigationController)
    private lazy var secondDayViewController = EventsViewController(eventType: .presentations,
                                                                    navigationController: navigationController)
    
    init() {
        super.init(topOffset: 16)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setTabBar()
        super.viewDidLoad()
        view.backgroundColor = .white
        title = Constants.Events.agenda
    }
    
    private func setTabBar() {
        settings.style.buttonBarLeftContentInset = 16
        settings.style.buttonBarRightContentInset = 16
    }
    
    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [firstDayViewController, secondDayViewController]
    }
}
