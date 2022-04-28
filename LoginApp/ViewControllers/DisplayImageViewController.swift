//
//  DisplayImageViewController.swift
//  LoginApp
//
//  Created by Julia Romanenko on 27.04.2022.
//

import UIKit

class DisplayImageViewController: UIViewController {

    @IBOutlet var image: UIImageView!
     
    private let person = personModel
    private let gradient = gradientModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.createdGradiendForDisplayImagesController(topColor: gradient.topColor, bottomColor: gradient.bottomColor)
        
        image.layer.cornerRadius = Radius.cornerRadius
        image.image = UIImage(named: photoModel.currentPhoto)
    }
    
}

extension UIView {
    func createdGradiendForDisplayImagesController(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
