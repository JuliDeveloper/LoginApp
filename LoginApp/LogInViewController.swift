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
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let greetingsVC = segue.destination as? MainViewController else { return }
        
        greetingsVC.userName = "Welcome, \(userNameTF.text ?? "")"
    }
}

extension LogInViewController {
    
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
