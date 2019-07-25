import UIKit

class EventViewController: UIViewController {

    let event: EventViewModel
    private let eventView = EventView()
    
    weak var eventViewDelegate: EventViewDelegate?

    init(event: EventViewModel) {
        self.event = event
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(eventView)
        setEventView()
    }

    private func setEventView() {
        eventView.viewDelegate = eventViewDelegate
        eventView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.bottom.equalTo(bottomLayoutGuide.snp.top)
            make.width.equalToSuperview()
        }
        eventView.viewModel = event
    }
}
