//
//  LoginViewController.swift
//  Messenger
//
//  Created by Aman  Bansal on 07/05/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func loginButton(_ sender: UIButton) {
        loginButtonTapped()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log in"
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(didTapRegister))
        emailField.delegate = self
        passwordField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func alertUserLoginError() {
        let alert = UIAlertController(title: "Whoops", message: "Please enter all information", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert,animated: true)
    }
    
    @objc private func didTapRegister() {
        let vc = RegisterViewController()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: false)
    }
    func loginButtonTapped() {
        guard let email = emailField.text, let password = passwordField.text, !email.isEmpty, !password.isEmpty, password.count >= 6 else {
            alertUserLoginError()
            return
        }
    }
}

// MARK:- UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == emailField) {
            passwordField.becomeFirstResponder()
        }
        if(textField == passwordField) {
            loginButtonTapped()
        }
        return true
    }
}
