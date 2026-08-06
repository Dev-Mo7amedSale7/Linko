//
//  RegisterViewController.swift
//  Linko
//
//  Created by Mohamed Sale7 on 06/08/2026.
//

import UIKit

class RegisterViewController: UIViewController {
    
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
        hideKeyboardWhenTappedAround()
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
        
        // handel register
        
    }
}


