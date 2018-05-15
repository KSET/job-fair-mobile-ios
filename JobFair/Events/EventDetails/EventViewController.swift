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
        eventView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                eventView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
                eventView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor),
                eventView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                eventView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                eventView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ]
        )
        eventView.viewModel = event
    }
}
