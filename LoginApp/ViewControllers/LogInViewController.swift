//
//  LogInViewController.swift
//  LoginApp
//
//  Created by Julia Romanenko on 11.04.2022.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let userName = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.delegate = self
        passwordTF.delegate = self
        
        userNameTF.returnKeyType = .next
        passwordTF.returnKeyType = .done
        passwordTF.enablesReturnKeyAutomatically = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let greetingsVC = segue.destination as? MainViewController else { return }
        guard let user = userNameTF.text else { return }
        
        greetingsVC.userName = "Welcome, \(user)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func logInButton() {
        if validationLogIn() {
            performSegue(withIdentifier: "showMainVC", sender: logInButton)
        }
    }
    
    @IBAction func forgotUserNameButton() {
        createAlertController(with: "Oops!",
                              and: "Your name is \(userName) ☺️")
    }
    
    @IBAction func forgotPasswordButton() {
        createAlertController(with: "Oops!",
                              and: "Your password is \(password) 😊")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    private func validationLogIn() -> Bool {
        guard let userName = userNameTF.text else { return false }
        guard let password = passwordTF.text else { return false }
        
        if userName.isEmpty || password.isEmpty || userNameTF.text != self.userName || passwordTF.text != self.password {
            createAlertController(with: "Invalid login or password",
                                  and: "Please, correct enter login and password")
        }
        
        return true
    }
    
    private func createAlertController(with title: String, and message: String) {
        let alertControler = UIAlertController(title: title,
                                               message: message,
                                               preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        
        alertControler.addAction(alertAction)
        present(alertControler, animated: true)
    }
}

//MARK: UITextFieldDelegate
extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else if validationLogIn() {
            passwordTF.resignFirstResponder()
            performSegue(withIdentifier: "showMainVC", sender: UIReturnKeyType.done)
        }
        return true
    }
    
}
