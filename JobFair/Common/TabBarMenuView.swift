import UIKit
import FanMenu
import Macaw

class TabBarMenuView: UIView {
    
    let fanMenuView: FanMenu
    let mainButtonView = UIImageView(image: UIImage(named: "fab"))
    
    override init(frame: CGRect) {
        fanMenuView = FanMenu(frame: .init(x: 0, y: 0, width: 300, height: 300))
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMenuItems() {
        guard SessionManager.instance.userRole == .company else {
            setDefaultItem()
            return
        }
        
        setCompanyItems()
    }
    
    private func commonInit() {
        addSubview(fanMenuView)
        fanMenuView.backgroundColor = .clear
        fanMenuView.menuBackground = .clear
        fanMenuView.radius = 24
        fanMenuView.menuRadius = 90
        
        addMainButtonView()
        setMenuItems()
    }
    
    private func addMainButtonView() {
        addSubview(mainButtonView)
        mainButtonView.pinToCenter(of: self)
        fanMenuView.button = FanMenuButton(id: Constants.Menu.ButtonId.main,
                                           image: nil,
                                           color: .clear)
    }
    
    private func setCompanyItems() {
        fanMenuView.interval = (-3 * Double.pi / 4, -Double.pi / 4)
        fanMenuView.items = [
            FanMenuButton(id: Constants.Menu.ButtonId.assistance,
                          image: "assistance",
                          color: .clear),
            FanMenuButton(id: Constants.Menu.ButtonId.drinks,
                          image: "drinks",
                          color: .clear),
            FanMenuButton(id: Constants.Menu.ButtonId.scanQRCode,
                          image: "qr_code",
                          color: .clear)
        ]
    }
    
    private func setDefaultItem() {
        fanMenuView.interval = (-Double.pi / 2, Double.pi)
        fanMenuView.items = [
            FanMenuButton(id: Constants.Menu.ButtonId.submitCV,
                          image: "submit_cv",
                          color: .clear),
            FanMenuButton(id: "",
                          image: nil,
                          color: .clear)
        ]
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return fanMenuView.point(inside: point, with: event)
    }
}
