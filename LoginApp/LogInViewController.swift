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
        
        greetingsVC.userName = "Welcome, \(userNameTF.text ?? "")"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func logInButton() {
        if userNameTF.text!.isEmpty && passwordTF.text!.isEmpty {
            createAlertController(with: "Invalid login or password",
                                  and: "Please, correct enter login and password")
        }
        
        if passwordTF.text != "Password" {
            createAlertController(with: "Invalid login or password",
                                  and: "Please, correct enter login and password")
        }
        
        performSegue(withIdentifier: "showMainVC", sender: logInButton)
    }
    
    @IBAction func forgotUserNameButton() {
        createAlertController(with: "Oops!",
                              and: "Your name is User ☺️")
    }
    
    @IBAction func forgotPasswordButton() {
        createAlertController(with: "Oops!",
                              and: "Your password is Password 😊")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
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
        } else {
            passwordTF.resignFirstResponder()
        }
    
        performSegue(withIdentifier: "showMainVC", sender: UIReturnKeyType.self)
        
        return true
    }
    
}
