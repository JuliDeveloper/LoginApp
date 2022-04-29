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
    
    @IBOutlet var loginButton: UIButton!
    
    private let user = User.getUserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createdGradiend()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        
        userNameTF.returnKeyType = .next
        passwordTF.returnKeyType = .done
        passwordTF.enablesReturnKeyAutomatically = true
        
        loginButton.layer.cornerRadius = Radius.cornerRadius
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
      
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                if let infoVC = navigationVC.topViewController as? InfoViewController {
                    infoVC.user = user
                } else if let likeNavigationVC = navigationVC.topViewController as? LikeViewController {
                    likeNavigationVC.user = user
                } else if let socialMediaVC = navigationVC.topViewController as? SocialMediaViewController {
                    socialMediaVC.user = user
                }
            }
        }
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
        createAlertController(with: "Ой!",
                              and: "Ваше имя - \(user.username) ☺️")
    }
    
    @IBAction func forgotPasswordButton() {
        createAlertController(with: "Ой!",
                              and: "Ваш пароль - \(user.password) 😊")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    private func validationLogIn() -> Bool {
        
        if userNameTF.text != user.username || passwordTF.text! != user.password {
            createAlertController(with: "Не праильный ввод данных",
                                  and: "Пожалуйста, введите корректное имя и пароль")
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
