//
//  BaseViewController.swift
//  Linko
//
//  Created by Mohamed Sale7 on 07/08/2026.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        hideKeyboardWhenTappedAround()
    }
    
    private func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {

        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default
            ) { _ in
                completion?()
            }
        )

        present(alert, animated: true)
    }
}
