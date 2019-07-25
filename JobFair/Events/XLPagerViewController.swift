import Foundation
import XLPagerTabStrip

class XLPagerViewController: ButtonBarPagerTabStripViewController {
    
    private let stackView = UIStackView()
    private let topOffset: CGFloat
    
    init(topOffset: CGFloat = 0) {
        self.topOffset = topOffset
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setTabBar()
        super.viewDidLoad()
        setSubviews()
        automaticallyAdjustsScrollViewInsets = false
    }
    
    private func setTabBar() {
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemFont = .tabBarTitle
        settings.style.selectedBarHeight = 0
        
        changeCurrentIndexProgressive = { (oldCell, newCell, progress, changeCurrentIndex, animated) in
            guard changeCurrentIndex == true else { return }
            oldCell?.layer.cornerRadius = 14
            newCell?.layer.cornerRadius = 14
            oldCell?.label.textColor = .brandColor
            newCell?.label.textColor = .white
            oldCell?.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            newCell?.backgroundColor = .brandColor
        }
    }
    
    private func setSubviews() {
        setStackView()
        setButtonBar()
        setContainerView()
    }
    
    private func setStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        view.addSubview(stackView)
        NSLayoutConstraint.activate(
            [
                stackView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: topOffset),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
                stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        )
    }
    
    private func setButtonBar() {
        buttonBarView.removeFromSuperview()
        stackView.addArrangedSubview(buttonBarView)
        buttonBarView.translatesAutoresizingMaskIntoConstraints = false
        buttonBarView.tintColor = .brandColor
        NSLayoutConstraint.activate(
            [
                buttonBarView.heightAnchor.constraint(equalToConstant: 32)
            ]
        )
    }
    
    private func setContainerView() {
        containerView.removeFromSuperview()
        stackView.addArrangedSubview(containerView)
    }
}
