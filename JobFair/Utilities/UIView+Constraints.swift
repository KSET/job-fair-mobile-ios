import UIKit

extension UIView {

    func pinToCenter(of view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                centerXAnchor.constraint(equalTo: view.centerXAnchor),
                centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ]
        )
    }
    
    func pinAllEdges(to view: UIView, padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding)
            ])
    }
    
    func matchWidth(of view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
}
