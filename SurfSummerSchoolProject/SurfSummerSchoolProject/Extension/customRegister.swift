//
//  customRegister.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 20.08.2022.
//

import UIKit

extension UICollectionView {
    
    func customRegister(_ someObject: AnyClass) {
        self.register(
            UINib(nibName: "\(someObject)", bundle: .main),
            forCellWithReuseIdentifier: "\(someObject)"
        )
    }
}

extension UITableView {
    
    func customRegister(_ someObject: AnyClass) {
        self.register(
            UINib(nibName: "\(someObject)", bundle: .main),
            forCellReuseIdentifier: "\(someObject)"
        )
    }
}
