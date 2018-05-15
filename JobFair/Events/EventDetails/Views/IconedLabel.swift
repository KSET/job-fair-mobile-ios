import UIKit

class IconedLabel: UIView {

    let imageView = UIImageView()
    let textLabel = UILabel()
    private let height: CGFloat = 20

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setView() {
        imageView.contentMode = .scaleAspectFit
        textLabel.font = .titleRegular
        let stackView = UIStackView(arrangedSubviews: [imageView, textLabel])
        stackView.spacing = .systemPadding
        stackView.alignment = .center
        addSubview(stackView)
        stackView.pinAllEdges(to: self)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                imageView.heightAnchor.constraint(equalToConstant: height),
                imageView.widthAnchor.constraint(equalToConstant: height)
            ]
        )
    }
}
