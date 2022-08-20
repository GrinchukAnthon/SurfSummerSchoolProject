//
//  MainViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 03.08.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
//    MARK: - Private Properties
    
    private let model: MainModel = .init()

//    MARK: - Views
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
//    MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        model.loadPosts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createSearchButtonInNavBar()
    }
}

//MARK: - Private Methods

private extension MainViewController {
    
    func configureApperance() {
        configureCollectionView()
        configureNavigationBar()
        configureModel()
    }
    
    func configureCollectionView() {
        collectionView.customRegister(MainItemCollectionViewCell.self)
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
    
    func configureNavigationBar() {
        navigationItem.title = "Главная"
    }
}

//MARK: - UIController

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(MainItemCollectionViewCell.self)",
            for: indexPath
        ) as? MainItemCollectionViewCell else { return UICollectionViewCell() }
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.model = model.items[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
