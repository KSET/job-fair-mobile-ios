import UIKit

class IconedLabel: UIView {

    let imageView = UIImageView()
    let textLabel = UILabel()
    private let imageHeight: CGFloat

    override init(frame: CGRect) {
        self.imageHeight = 20
        super.init(frame: frame)
        setView()
    }
    
    init(imageHeight: CGFloat = 20) {
        self.imageHeight = imageHeight
        super.init(frame: .zero)
        setView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setView() {
        backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        textLabel.font = .cellTitleMedium
        textLabel.textAlignment = .left
        
        let stackView = UIStackView(arrangedSubviews: [imageView, textLabel])
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.pinAllEdges(to: self)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                imageView.heightAnchor.constraint(equalToConstant: imageHeight),
                imageView.widthAnchor.constraint(equalToConstant: imageHeight)
            ]
        )
    }
}
