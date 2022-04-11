//
//  MainViewController.swift
//  LoginApp
//
//  Created by Julia Romanenko on 11.04.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var greetingsLable: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingsLable.text = userName
    }
}
