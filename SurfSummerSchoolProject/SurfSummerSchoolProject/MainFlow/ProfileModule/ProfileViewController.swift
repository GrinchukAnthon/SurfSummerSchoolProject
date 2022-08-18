//
//  ProfileViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 03.08.2022.
//

import UIKit

final class ProfileViewController: UIViewController {

//    MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
    }
}

//  MARK: - Private Methods

private extension ProfileViewController {
    
    func configureApperance() {
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
        navigationItem.title = "Профиль"
    }
}
