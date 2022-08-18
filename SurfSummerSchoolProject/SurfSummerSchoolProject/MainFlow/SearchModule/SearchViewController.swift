//
//  SearchViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 08.08.2022.
//

import UIKit

final class SearchViewController: UIViewController {

//    MARK: - Properties
    private var searchView = SearchView()
    

//    MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createBackArrowButtonInNavBar()
        searchView.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchView.isHidden = true
    }
    
//    MARK: - Private Methods
    
    private func setupNavigationBar() {
        
        navigationController?.navigationBar.addSubview(searchView)
        
        searchView.translatesAutoresizingMaskIntoConstraints = false
        
        guard let navigationBar = navigationController?.navigationBar else { return }
        
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: navigationBar.topAnchor),
            searchView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 56),
            searchView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            searchView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor)
        ])
        
        searchView.textFieldChanged = {/* [weak self] */text in
            print(text ?? "")
        }
    }
}
