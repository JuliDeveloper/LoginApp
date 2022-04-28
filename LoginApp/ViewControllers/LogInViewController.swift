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
    
    private let person = User.getUserInfo()
    private let gradient = gradientModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.createdGradiendForLoginController(topColor: gradient.topColor, bottomColor: gradient.bottomColor)
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        
        userNameTF.returnKeyType = .next
        passwordTF.returnKeyType = .done
        passwordTF.enablesReturnKeyAutomatically = true
        
        loginButton.layer.cornerRadius = Radius.cornerRadius
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tabBarController = segue.destination as! UITabBarController
        guard let viewControllers = tabBarController.viewControllers else { return }
      
        for viewController in viewControllers {
                    if let greetingsVC = viewController as? MainViewController {
                        greetingsVC.userName = "Привет, \(person.person.name)!"
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
                              and: "Ваше имя - \(person.username) ☺️")
    }
    
    @IBAction func forgotPasswordButton() {
        createAlertController(with: "Ой!",
                              and: "Ваш пароль - \(person.password) 😊")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    private func validationLogIn() -> Bool {
        guard let userName = userNameTF.text else { return false }
        guard let password = passwordTF.text else { return false }
        
        if userName.isEmpty || password.isEmpty || userNameTF.text != person.username || passwordTF.text! != person.password {
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

extension UIView {
    func createdGradiendForLoginController(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
