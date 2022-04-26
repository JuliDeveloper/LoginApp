//
//  MainViewController.swift
//  LoginApp
//
//  Created by Julia Romanenko on 11.04.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var backgroundGradientView: UIView!
    @IBOutlet var greetingsLable: UILabel!
   
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createdGradiend()
        
        greetingsLable.text = userName
    }
    
    private func createdGradiend() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.systemIndigo.cgColor,
                           UIColor.systemPink.cgColor]
        gradient.shouldRasterize = true
        backgroundGradientView.layer.addSublayer(gradient)
    }
}
