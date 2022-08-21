//
//  AuthResponseModel.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 18.08.2022.
//

import Foundation

struct AuthResponseModel: Codable {
    
    let token: String
    let userInfo: UserInfo
    
    enum CodingKeys: String, CodingKey {
        case token
        case userInfo = "user_info"
    }
}

struct UserInfo: Codable {
    
    let id: String?
    let phone: String?
    let email: String?
    let firstName: String?
    let lastName: String?
    let avatar: String?
    let city: String?
    let about: String?
}
