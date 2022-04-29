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
    
    var user: User!
    var colors: GradientColors!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createdGradiend()
        
        imageTop.image = UIImage(named: user.person.photo.smile)
        imageBottom.image = UIImage(named: user.person.photo.like)
        
        dogsButton.layer.cornerRadius = Radius.cornerRadius
        gameButton.layer.cornerRadius = Radius.cornerRadius
        drawingButton.layer.cornerRadius = Radius.cornerRadius
    }
    
    @IBAction func openDogsImage() {
        user.person.photo.currentPhoto = user.person.photo.dogs
    }
  
    @IBAction func openGameImage() {
        user.person.photo.currentPhoto = user.person.photo.game
    }
    
    @IBAction func openDrawingImage() {
        user.person.photo.currentPhoto = user.person.photo.image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? DisplayImageViewController else { return }
        imageVC.user = user
    }
}
