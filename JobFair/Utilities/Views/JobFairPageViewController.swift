import Foundation
import UIKit

protocol Swipeable {
    var hasNext: Bool { get }
    var hasPrevious: Bool { get }
    func showNextPage()
    func showPreviousPage()
}

class JobFairPageViewController: UIViewController {
    typealias SwipeablePager = UIPageViewController & Swipeable

    private let pager: SwipeablePager
    private let buttonStackView = UIStackView()
    private let buttonStackViewSeparator = UIView()
    private let previousButton = UIButton(type: .system)
    private let nextButton = UIButton(type: .system)

    init(pager: SwipeablePager) {
        self.pager = pager
        super.init(nibName: nil, bundle: nil)
        pager.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setButtonStackView()
        addSubviews()
        setNextButton()
        setPreviousButton()
        togglNavigationButtonsState()
    }

    private func setPreviousButton() {
        previousButton.setTitle("Previous", for: .normal)
        previousButton.titleLabel?.textAlignment = .left
        previousButton.addTarget(self, action: #selector(didTapPreviousButton), for: .touchUpInside)
    }

    private func setNextButton() {
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.textAlignment = .right
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
    }

    private func setButtonStackView() {
        buttonStackView.addArrangedSubview(previousButton)
        buttonStackView.addArrangedSubview(nextButton)
        buttonStackView.distribution = .equalSpacing
    }

    private func addSubviews() {
        pager.willMove(toParentViewController: self)
        buttonStackViewSeparator.backgroundColor = .gray
        addChildViewController(pager)
        view.addSubview(pager.view)
        view.addSubview(buttonStackView)
        view.addSubview(buttonStackViewSeparator)

        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        pager.view.translatesAutoresizingMaskIntoConstraints = false
        buttonStackViewSeparator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                pager.view.topAnchor.constraint(equalTo: view.topAnchor),
                pager.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                pager.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .systemPadding),
                buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.systemPadding),
                buttonStackView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor),
                previousButton.heightAnchor.constraint(equalToConstant: 44),
                nextButton.heightAnchor.constraint(equalToConstant: 44),
                buttonStackViewSeparator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                buttonStackViewSeparator.widthAnchor.constraint(equalTo: view.widthAnchor),
                buttonStackViewSeparator.topAnchor.constraint(equalTo: pager.view.bottomAnchor),
                buttonStackViewSeparator.heightAnchor.constraint(equalToConstant: 0.5)
            ]
        )
        setBottomConstraint()
        pager.didMove(toParentViewController: self)
    }

    @objc
    private func didTapPreviousButton() {
        pager.showPreviousPage()
        togglNavigationButtonsState()
    }

    @objc
    private func didTapNextButton() {
        pager.showNextPage()
        togglNavigationButtonsState()
    }

    private func setBottomConstraint() {
        guard pager.hasPrevious || pager.hasNext else {
            buttonStackView.isHidden = true
            pager.view.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
            return
        }

        buttonStackView.topAnchor.constraint(equalTo: buttonStackViewSeparator.bottomAnchor).isActive = true
    }

    private func togglNavigationButtonsState() {
        previousButton.isEnabled = pager.hasPrevious
        nextButton.isEnabled = pager.hasNext
    }
}

extension JobFairPageViewController: UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else {
            return
        }

        togglNavigationButtonsState()
    }
}
