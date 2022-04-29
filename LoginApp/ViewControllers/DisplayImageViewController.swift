//
//  DisplayImageViewController.swift
//  LoginApp
//
//  Created by Julia Romanenko on 27.04.2022.
//

import UIKit

class DisplayImageViewController: UIViewController {

    @IBOutlet var image: UIImageView!
     
    var user: User!
    var colors: GradientColors!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createdGradiend()
        
        image.layer.cornerRadius = Radius.cornerRadius
        image.image = UIImage(named: user.person.photo.currentPhoto)
    }
}

