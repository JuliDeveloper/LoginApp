//
//  MainViewController.swift
//  LoginApp
//
//  Created by Julia Romanenko on 11.04.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var greetingsLable: UILabel!
    @IBOutlet var logoutButton: UIButton!
    
    var userName = ""
    private let gradient = gradientModel
    
    let topColor = UIColor(red: 255/255, green: 181/255, blue: 216/255, alpha: 1)
    let bottomColor = UIColor(red: 174/255, green: 242/255, blue: 165/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.createdGradiendForGreetingsController(topColor: gradient.topColor, bottomColor: gradient.bottomColor)
        logoutButton.layer.cornerRadius = Radius.cornerRadius
        greetingsLable.text = userName
    }
}

extension UIView {
    func createdGradiendForGreetingsController(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
