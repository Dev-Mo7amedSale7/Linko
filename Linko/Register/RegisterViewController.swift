//
//  RegisterViewController.swift
//  Linko
//
//  Created by Mohamed Sale7 on 06/08/2026.
//

import UIKit

class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var createAccountTitle: UILabel!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var fullNameTxf: LinkoTextField!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailTxf: LinkoTextField!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var passwordTxf: LinkoTextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var backImage: UIImageView!
    
    static func instantiate() -> RegisterViewController {
        let storyboard = UIStoryboard(name: "Register", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBackGesture()
    }

    private func setupBackGesture() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(backTapped)
        )
        
        backView.addGestureRecognizer(tap)
    }

    @objc private func backTapped() {
        navigationController?.popViewController(animated: true)
    }

    
    func setupUI() {
        navigationItem.hidesBackButton = true
        backView.layer.cornerRadius = 12
        backView.layer.borderWidth = 1
        backView.layer.borderColor = UIColor.textFaint.cgColor
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18, weight: .bold),
            .foregroundColor: UIColor.white
        ]
        
        let attributedTitle = NSAttributedString(
            string: "Create account",
            attributes: attributes
        )
        
        registerBtn.setAttributedTitle(attributedTitle, for: .normal)
        registerBtn.backgroundColor = .primaryDarkOrange
        registerBtn.layer.cornerRadius = 15
    }
    
    
    @IBAction func registerBtnAction(_ sender: Any) {

        guard
            let name = fullNameTxf.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            !name.isEmpty,
            let email = emailTxf.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            !email.isEmpty,
            let password = passwordTxf.text,
            !password.isEmpty
        else {

            showAlert(title: "Error", message: "Please fill all fields.")
            return
        }

        registerBtn.isEnabled = false

        AuthManager.shared.register(
            name: name,
            email: email,
            password: password
        ) { [weak self] result in

            guard let self = self else { return }

            self.registerBtn.isEnabled = true

            switch result {

            case .success(let response):

                let message = response["message"] as? String ?? "User created successfully"

                self.showAlert(title: "Success", message: message) {
                    self.navigationController?.popViewController(animated: true)
                }

            case .failure(let error):

                self.showAlert(title: "Error", message: error.localizedDescription)
            }
        }
    }
}


