//
//  PersonInfoViewController.swift
//  LoginApp
//
//  Created by Julia Romanenko on 27.04.2022.
//

import UIKit

class PersonInfoViewController: UIViewController {

    @IBOutlet var personImage: UIImageView!
    
    @IBOutlet var fullNameLable: UILabel!
    @IBOutlet var ageLable: UILabel!
    
    private let person = personModel
    private let gradient = gradientModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.createdGradiendForPersonInfoController(topColor: gradient.topColor, bottomColor: gradient.bottomColor)
        
        setBackButton()
        addImage()
        addInfoAboutPerson()
    }
    
    private func setBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = "Назад"
        backButton.tintColor = UIColor(red: 255/255, green: 120/255, blue: 212/255, alpha: 1)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func addImage() {
        personImage.layer.cornerRadius = Radius.cornerRadius
        personImage.image = UIImage(named: person.photo.user)
    }
    
    private func addInfoAboutPerson() {
        let fullName = person.name + " " + person.surename
        let age = person.age
        
        fullNameLable.text = fullName
        ageLable.text = "\(age) лет"
    }

}

extension UIView {
    func createdGradiendForPersonInfoController(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
