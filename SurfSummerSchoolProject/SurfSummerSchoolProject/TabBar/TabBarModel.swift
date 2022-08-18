//
//  TabBarModel.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 03.08.2022.
//

import UIKit

enum TabBarModel {
    case main
    case favorite
    case profile
    
    var title: String {
        switch self {
        case .main:
            return "Главная"
        case .favorite:
            return "Избранное"
        case .profile:
            return "Профиль"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .main:
            return UIImage(assetIdentifier: .mainTab)
        case .favorite:
            return UIImage(assetIdentifier: .favoriteTab)
        case .profile:
            return UIImage(assetIdentifier: .profileTab)
        }
    }
    
    var selectedImage: UIImage? {
        return image
    }
}
