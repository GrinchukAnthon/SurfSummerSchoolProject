//
//  FavoriteViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 03.08.2022.
//

import UIKit

final class FavoriteViewController: UIViewController {
    
//    MARK: - Views
    
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
//    MARK: - Properties
    
    private let model: MainModel = .init()
    private var model2: DetailItemModel?
    
//    MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchButtonInNavBar()
        configureApperance()
        model.loadPosts()
    }
}

//  MARK: - Private Methods

private extension FavoriteViewController {
    
    func configureApperance() {
        configureCollectionView()
        configureNavigationBar()
        configureModel()
    }
    func configureCollectionView() {
        favoriteCollectionView.customRegister(FavoriteCollectionViewCell.self)
        favoriteCollectionView.dataSource = self
        favoriteCollectionView.delegate = self
    }
    func configureNavigationBar() {
        navigationItem.title = "Избранное"
    }
    func configureModel() {
        model.didItemsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.favoriteCollectionView.reloadData()
            }
        }
    }
}

extension FavoriteViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(FavoriteCollectionViewCell.self)",
            for: indexPath
        ) as? FavoriteCollectionViewCell else { return UICollectionViewCell() }
        
        let item = model.items[indexPath.row]
        cell.imageUrlInString = item.imageUrlInString
        cell.title = item.title
        cell.date = item.dateCreation
        cell.text = item.content
        cell.isFavorite = item.isFavorite
        cell.didFavoritesTapped = { [weak self] in
            self?.model.items[indexPath.row].isFavorite.toggle()
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = view.frame.width
        return CGSize(width: itemWidth, height: Constants.heightToWidthRatioForFavoriteVC * itemWidth)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenRowsForFavoriteVC
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.model = model.items[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
