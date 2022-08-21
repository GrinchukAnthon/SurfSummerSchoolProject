//
//  Extension UIImage.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 16.08.2022.
//

import UIKit

extension UIImage {
    enum AssetIdentifier: String {
        case backArrow = "back-arrow"
        case favoriteTab = "favoriteTab"
        case heartFill = "heart-fill"
        case heart = "heart"
        case mainTab = "mainTab"
        case profileTab = "profileTab"
        case searchBarButton = "search-barButton"
        case searchCancel = "search-cancel"
        case searchTextField = "search-textField"
        case surfSplash = "surfSplash"
        case defaultImage = "default-image"
        case openEye = "openEye"
        case closedEye = "closedEye"
    }
    
    convenience init(assetIdentifier: AssetIdentifier) {
        self.init(named: assetIdentifier.rawValue)!
    }
}
