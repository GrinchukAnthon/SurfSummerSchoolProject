//
//  AuthRequestModel.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 18.08.2022.
//

import Foundation

struct AuthRequestModel: Encodable {
    
    let phone: String
    let password: String
}
