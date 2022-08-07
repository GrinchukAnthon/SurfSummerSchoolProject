//
//  ProfileViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 03.08.2022.
//

import UIKit

final class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
    }
}


private extension ProfileViewController {
    
    func configureApperance() {
        navigationBarConfigure()
    }
    
    func navigationBarConfigure() {
        navigationItem.title = "Профиль"
    }
}
