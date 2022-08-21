//
//  Extension UIColor.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 16.08.2022.
//

import UIKit

extension UIColor {
    
    static let surfLidhtGreyForLabelAutorizationScreen = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    static let surfLightGrey = UIColor(red: 245, green: 245, blue: 245, alpha: 1)
    static let surfGrey = UIColor(red: 179, green: 179, blue: 179, alpha: 1)
    static let surfBlack = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    static let surfWhiteForConteinerViewAutorizationScreen = UIColor(red: 251, green: 251, blue: 251, alpha: 1)
    static let surfWhite = UIColor(red: 240, green: 240, blue: 240, alpha: 1)
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
