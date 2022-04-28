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
    
    private let person = personModel
    private let gradient = gradientModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.createdGradiendForSocialMediaController(topColor: gradient.topColor, bottomColor: gradient.bottomColor)
        
        instLable.text = "Instagram"
        vkLable.text = "ВКонтакте"
        
        instaButton.layer.cornerRadius = Radius.cornerRadius
        vkButton.layer.cornerRadius = Radius.cornerRadius
        
        imageView.image = UIImage(named: person.photo.hello)
    }
 
    @IBAction func goInst() {
        guard let url = URL(string: person.instagram) else { return }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @IBAction func goVk() {
        guard let url = URL(string: person.vk) else { return }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
}

extension UIView {
    func createdGradiendForSocialMediaController(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
