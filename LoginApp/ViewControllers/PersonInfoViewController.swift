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
    
    var user: User!
    var colors: GradientColors!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createdGradiend()
        
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
        personImage.image = UIImage(named: user.person.photo.user)
    }
    
    private func addInfoAboutPerson() {
        let fullName = user.person.name + " " + user.person.surename
        let age = user.person.age
        
        fullNameLable.text = fullName
        ageLable.text = "\(age) лет"
    }

}
