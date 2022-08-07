//
//  FavoriteViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 03.08.2022.
//

import UIKit

final class FavoriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
    }
}

private extension FavoriteViewController {
    
    func configureApperance() {
        navigationBarConfigure()
    }
    
    func navigationBarConfigure() {
        navigationItem.title = "Избранное"
    }
}
