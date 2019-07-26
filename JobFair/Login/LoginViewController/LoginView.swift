import UIKit

class LoginView: UIView {
    
    private let backgroundOverlayImageView = UIImageView()
    private let logoImageView = UIImageView()
    let loginButton = UIButton.secondaryButton
    let skipButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = .brandColor
        setupBackgroundOverlay()
        setupLogoImage()
        setupSkipButton()
        setupLoginButton()
    }
    
    private func setupBackgroundOverlay() {
        addSubview(backgroundOverlayImageView)
        backgroundOverlayImageView.image = UIImage(named: "background_overlay")
        backgroundOverlayImageView.alpha = 0.3
        backgroundOverlayImageView.contentMode = .scaleAspectFill
        backgroundOverlayImageView.pinAllEdges(to: self)
    }
        
    private func setupLogoImage() {
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = UIImage(named: "launch_image")
        addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -32),
                logoImageView.widthAnchor.constraint(equalToConstant: 240),
                logoImageView.heightAnchor.constraint(equalToConstant: 120)
            ]
        )
    }
    
    private func setupLoginButton() {
        addSubview(loginButton)
        loginButton.setTitle(Constants.Login.loginButtonTitle, for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                loginButton.heightAnchor.constraint(equalToConstant: 48),
                loginButton.bottomAnchor.constraint(equalTo: skipButton.topAnchor, constant: -16),
                loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
            ]
        )
    }
    
    private func setupSkipButton() {
        addSubview(skipButton)
        skipButton.titleLabel?.font = .titleRegular
        skipButton.setTitle(Constants.Login.skipButtonTitle, for: .normal)
        skipButton.setTitleColor(.white, for: .normal)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                skipButton.heightAnchor.constraint(equalToConstant: 48),
                skipButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
                skipButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                skipButton.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16),
                skipButton.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16)
            ]
        )
    }
}
