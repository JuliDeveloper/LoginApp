//
//  SocialMediaViewController.swift
//  LoginApp
//
//  Created by Julia Romanenko on 27.04.2022.
//

import SafariServices
import UIKit

class SocialMediaViewController: UIViewController {

    @IBOutlet var instLable: UILabel!
    @IBOutlet var vkLable: UILabel!
    
    @IBOutlet var instaButton: UIButton!
    @IBOutlet var vkButton: UIButton!
    
    @IBOutlet var imageView: UIImageView!
    
    var user: User!
    var colors: GradientColors!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createdGradiend()
        
        instLable.text = "Instagram"
        vkLable.text = "ВКонтакте"
        
        instaButton.layer.cornerRadius = Radius.cornerRadius
        vkButton.layer.cornerRadius = Radius.cornerRadius
        
        imageView.image = UIImage(named: user.person.photo.hello)
    }
 
    @IBAction func goInst() {
        guard let url = URL(string: user.person.instagram) else { return }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @IBAction func goVk() {
        guard let url = URL(string: user.person.vk) else { return }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
}
