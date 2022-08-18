//
//  Extension CreateButtonsInNavBar.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 16.08.2022.
//

import UIKit

extension UIViewController: UIGestureRecognizerDelegate {
    
    func createBackArrowButtonInNavBar() {
        let backButton = UIBarButtonItem(image: UIImage(assetIdentifier: .backArrow),
                                         style: .plain,
                                         target: navigationController,
                                         action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func createSearchButtonInNavBar() {
        let searchButton = UIBarButtonItem(image: UIImage(assetIdentifier: .searchBarButton),
                                           style: .plain,
                                           target: self,
                                           action: #selector(searchButtonTapped(_:)))
        navigationItem.rightBarButtonItem = searchButton
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func searchButtonTapped(_: UIBarButtonItem) {
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}
