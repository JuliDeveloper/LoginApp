//
//  LikeViewController.swift
//  LoginApp
//
//  Created by Julia Romanenko on 27.04.2022.
//

import UIKit

class LikeViewController: UIViewController {

    @IBOutlet var imageTop: UIImageView!
    @IBOutlet var imageBottom: UIImageView!
    
    @IBOutlet var dogsButton: UIButton!
    @IBOutlet var gameButton: UIButton!
    @IBOutlet var drawingButton: UIButton!
    
    private var person = personModel
    private let gradient = gradientModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.createdGradiendForLikeController(topColor: gradient.topColor, bottomColor: gradient.bottomColor)

        imageTop.image = UIImage(named: person.photo.smile)
        imageBottom.image = UIImage(named: person.photo.like)
        
        dogsButton.layer.cornerRadius = Radius.cornerRadius
        gameButton.layer.cornerRadius = Radius.cornerRadius
        drawingButton.layer.cornerRadius = Radius.cornerRadius
    }
    
    
    @IBAction func openDogsImage() {
        photoModel.currentPhoto = person.photo.dogs
    }
  
    @IBAction func openGameImage() {
        photoModel.currentPhoto = person.photo.game
    }
    
    @IBAction func openDrawingImage() {
        photoModel.currentPhoto = person.photo.image
    }
}

extension UIView {
    func createdGradiendForLikeController(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
