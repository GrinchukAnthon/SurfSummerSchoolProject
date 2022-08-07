//
//  FavoriteViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 03.08.2022.
//

import UIKit

final class FavoriteViewController: UIViewController {

//    MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
    }
}

//  MARK: - Private Methods

private extension FavoriteViewController {
    
    func configureApperance() {
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
        navigationItem.title = "Избранное"
    }
}
