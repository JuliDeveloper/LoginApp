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
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createdGradiend()
        
        centerImage.image = UIImage(named: user.person.photo.hands)
        
        infoButton.layer.cornerRadius = Radius.cornerRadius
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let personVC = segue.destination as? PersonInfoViewController else { return }
        personVC.user = user
    }
}

