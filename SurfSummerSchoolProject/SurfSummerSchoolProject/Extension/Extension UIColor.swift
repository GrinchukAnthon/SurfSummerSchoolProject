//
//  Extension UIColor.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 16.08.2022.
//

import UIKit

extension UIColor {
    
    static let surfLightGrey = UIColor(red: 245, green: 245, blue: 245)
    static let surfGrey = UIColor(red: 179, green: 179, blue: 179)
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: alpha
        )
    }
}
