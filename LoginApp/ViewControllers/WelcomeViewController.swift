//
//  MainViewController.swift
//  LoginApp
//
//  Created by Julia Romanenko on 11.04.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var greetingsLable: UILabel!
    @IBOutlet var logoutButton: UIButton!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createdGradiend()
        
        logoutButton.layer.cornerRadius = Radius.cornerRadius
        greetingsLable.text = "Привет, \(user.person.name)!"
    }
}
