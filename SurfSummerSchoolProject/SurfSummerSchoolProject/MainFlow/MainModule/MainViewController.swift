//
//  MainViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 03.08.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
//    MARK: - Constants
    
    private enum Constants {
        static let horisontalInset: CGFloat = 16
        static let spaceBetweenElements: CGFloat = 7
        static let spaceBetweenRows: CGFloat = 16
    }
    
//    MARK: - Private Properties
    
    private let model: MainModel = .init()

//    MARK: - Views
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
//    MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        model.getPosts()
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
        collectionView.register(
            UINib(nibName: "\(MainItemCollectionViewCell.self)", bundle: .main),
            forCellWithReuseIdentifier: "\(MainItemCollectionViewCell.self)"
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = .init(top: 10, left: 16, bottom: 10, right: 16)
    }
    
    func configureModel() {
        model.didItemsUpdated = { [weak self] in
            self?.collectionView.reloadData()
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MainItemCollectionViewCell.self)", for: indexPath)
        if let cell = cell as? MainItemCollectionViewCell {
            let item = model.items[indexPath.row]
            cell.title = item.title
            cell.isFavorite = item.isFaforite
            cell.image = model.items[indexPath.row].image
            cell.didFavoritesTapped = { [weak self] in
                self?.model.items[indexPath.row].isFaforite.toggle()
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (view.frame.width - Constants.horisontalInset * 2 - Constants.spaceBetweenElements) / 2
        return CGSize(width: itemWidth, height: 1.46 * itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenRows
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenElements
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.model = model.items[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}