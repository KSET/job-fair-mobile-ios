import Foundation
import BarcodeScanner

class BarcodeController {
    
    weak var delegate: DismissDelegate?
}

extension BarcodeController: BarcodeScannerCodeDelegate {
    
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        guard let data = code.data(using: .utf8),
            let studentInfo = try? JSONDecoder().decode(StudentInfo.self, from: data),
            !studentInfo.resumeUid.isEmpty else {
                showErrorMessage(on: controller)
                return
        }
        
        let viewController = StudentReviewViewController(studentInfo: studentInfo)
        viewController.delegate = delegate
        let navigationController = BaseNavigationController(rootViewController: viewController)
        controller.present(navigationController, animated: true, completion: nil)
    }
}

extension BarcodeController: BarcodeScannerDismissalDelegate {
    
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension BarcodeController: BarcodeScannerErrorDelegate {
    
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        showErrorMessage(on: controller)
    }
    
    private func showErrorMessage(on controller: BarcodeScannerViewController) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            controller.resetWithError(message: Constants.StudentReview.errorMessage)
        }
    }
}
