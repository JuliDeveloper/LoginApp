//
//  InfoAboutUser.swift
//  LoginApp
//
//  Created by Julia Romanenko on 27.04.2022.
//

import Foundation
import UIKit


struct Photo {
    
    let user: String
    let smile: String
    let image: String
    let dogs: String
    let game: String
    let hello: String
    let like: String
    let toungle: String
    let hands: String
    let stars: String
    var currentPhoto: String
    
    static func getPhoto() -> Photo {
        Photo(
            user: "Self",
            smile: "Smile",
            image: "Serpent",
            dogs: "Dogs",
            game: "Wow",
            hello: "Hello",
            like: "Like",
            toungle: "Toungle",
            hands: "Hands",
            stars: "Stars",
            currentPhoto: ""
        )
    }
}

struct Person {
    let name: String
    let surename: String
    let age: String
    let instagram: String
    let vk: String
    var photo: Photo
    
    static func getPersonInfo() -> Person {
        Person(
            name: "Юлия",
            surename: "Романенко",
            age: "25",
            instagram: "https://www.instagram.com/_drekra_/",
            vk: "https://vk.com/drekra",
            photo: Photo.getPhoto()
        )
    }
}

struct User {
    let username: String
    let password: String
    var person: Person
    
    static func getUserInfo() -> User {
        User(
            username: "User",
            password: "Password",
            person: Person.getPersonInfo()
        )
    }
}

struct Radius {
    static let cornerRadius: CGFloat = 5.0
}
