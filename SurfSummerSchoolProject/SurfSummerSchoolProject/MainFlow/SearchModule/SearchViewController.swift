//
//  SearchViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 08.08.2022.
//

import UIKit

final class SearchViewController: UIViewController {

//    MARK: - Private Properties
    
    private var searchView = SearchView()
    private let model: MainModel = .init()
    
//    MARK: - Views
        
        @IBOutlet private weak var collectionView: UICollectionView!
        
//    MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperence()
        model.loadPosts()
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
}

//    MARK: - Private Methods

private extension SearchViewController {
    
    func configureApperence() {
        setupNavigationBar()
        configureCollectionView()
        configureModel()
    }
    func setupNavigationBar() {
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
    func configureCollectionView() {
        collectionView.customRegister(SearchCollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = .init(top: 10, left: 16, bottom: 10, right: 16)
    }
    func configureModel() {
        model.didItemsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}

//MARK: - UIController

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(SearchCollectionViewCell.self)",
            for: indexPath
        ) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        
        let item = model.items[indexPath.row]
        cell.title = item.title
        cell.isFavorite = item.isFavorite
        cell.imageUrlInString = item.imageUrlInString
        cell.didFavoritesTapped = { [weak self] in
            self?.model.items[indexPath.row].isFavorite.toggle()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (view.frame.width - Constants.horisontalInsetForMainVC * 2 - Constants.spaceBetweenElementsForMainVC) / 2
        return CGSize(width: itemWidth, height: Constants.heightToWidthRatioForMainVC * itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenRowsForMainVC
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenElementsForMainVC
    }
}
