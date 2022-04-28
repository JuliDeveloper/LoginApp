//
//  InfoViewController.swift
//  LoginApp
//
//  Created by Julia Romanenko on 27.04.2022.
//

import UIKit

class InfoViewController: UIViewController {

    
    @IBOutlet var centerImage: UIImageView!
    @IBOutlet var infoButton: UIButton!
    
    private let person = personModel
    private let gradient = gradientModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.createdGradiendForInfoController(topColor: gradient.topColor, bottomColor: gradient.bottomColor)
        
        centerImage.image = UIImage(named: person.photo.hands)
        
        infoButton.layer.cornerRadius = Radius.cornerRadius
    }
    
    @IBAction func button() {
        
    }
}

extension UIView {
    func createdGradiendForInfoController(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
