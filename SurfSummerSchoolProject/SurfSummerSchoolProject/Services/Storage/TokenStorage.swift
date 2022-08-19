//
//  TokenStorage.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 18.08.2022.
//

import Foundation

protocol TokenStorage {
    
    func getToken() throws -> TokenContainer
    func set(newToken: TokenContainer) throws
}
