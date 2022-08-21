//
//  ProfileModel.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 20.08.2022.
//

import Foundation
import UIKit

final class ProfileModel {
    
    var didItemsUpdated: (() -> Void)?
    
    var items: [ProfileItemModel] = [] {
        didSet {
            didItemsUpdated?()
        }
    }
    
    func getPost() {
        items = Array(repeating: ProfileItemModel.createDefault(), count: 100)
    }
    
}

struct ProfileItemModel {

    // MARK: - Internal Properties

    let phone: String
    let email: String
    var firstName: String
    let lastName: String
    let avatar: UIImage?
    let city: String
    let about: String

    // MARK: - Initialization

//    internal init(phone: String, email: String, firstName: String, lastName: String, avatar: String, city: String, about: String) {
//        self.phone = phone
//        self.email = email
//        self.firstName = firstName
//        self.lastName = lastName
//        self.avatar = avatar
//        self.city = city
//        self.about = about
//    }
    
    static func createDefault() -> ProfileItemModel {
        .init(phone: "+7969-123-92-27", email: "realgrinch@yandex.ru", firstName: "Anton", lastName: "Grinchuk", avatar: UIImage(assetIdentifier: .defaultImage), city: "Moscow", about: "Swift Developer")
    }
}

