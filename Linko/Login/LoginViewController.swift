//
//  LoginViewController.swift
//  Linko
//
//  Created by Mohamed Sale7 on 06/08/2026.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var wellcomeBackTitle: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailTxf: LinkoTextField!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var passwordTxf: LinkoTextField!
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var descrptionLogin: UILabel!
    
    static func instantiate() -> LoginViewController {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        hideKeyboardWhenTappedAround()
        setupSignUpButton()
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
        setupLoginButton()
        setupSignUpButton()
    }
    
    
    func setupLoginButton() {
        
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18, weight: .bold),
            .foregroundColor: UIColor.white
        ]
        
        let attributedTitle = NSAttributedString(
            string: "Log in",
            attributes: attributes
        )
        
        logInBtn.setAttributedTitle(attributedTitle, for: .normal)
        logInBtn.backgroundColor = .primaryDarkOrange
        logInBtn.layer.cornerRadius = 15
    }
    
    
    private func setupSignUpButton() {
        descrptionLogin.text = "log in to see your request and offers"
        let text = "Don't have an account? "
        let signUpText = "Sign up"
        
        let attributedString = NSMutableAttributedString(
            string: text + signUpText
        )
        
        attributedString.addAttributes(
            [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.textMuted
            ],
            range: NSRange(location: 0, length: text.count)
        )
        
        attributedString.addAttributes(
            [
                .font: UIFont.systemFont(ofSize: 16, weight: .bold),
                .foregroundColor: UIColor.primaryDarkOrange
            ],
            range: NSRange(location: text.count, length: signUpText.count)
        )
        
        signUp.setAttributedTitle(attributedString, for: .normal)
    }
    
    
    
    
    @IBAction func logInBtnBtnAction(_ sender: Any) {
        
        // handel login
        
    }
    
    @IBAction func signupBtnAction(_ sender: Any) {
        let vc = RegisterViewController.instantiate()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
