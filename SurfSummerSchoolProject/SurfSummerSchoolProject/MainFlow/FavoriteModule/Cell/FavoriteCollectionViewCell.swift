//
//  FavoriteCollectionViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 20.08.2022.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
      
//    MARK: - Views
    
    @IBOutlet private weak var favoriteImageView: UIImageView!
    @IBOutlet private weak var favoriteTitleLabel: UILabel!
    @IBOutlet private weak var favoriteDateLabel: UILabel!
    @IBOutlet private weak var favoriteContentLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    
//    MARK: - Properties
    
    var imageUrlInString: String = "" {
        didSet {
            guard let url = URL(string: imageUrlInString) else {
                return
            }
            favoriteImageView.loadImage(from: url)
        }
    }
    
//    MARK: - Events
    
    var didFavoritesTapped: (() -> Void)?
    
//    MARK: - Calculated
    
    var buttonImage: UIImage? {
        return isFavorite ? Constants.heartImage : Constants.fillHeartImage
    }
    
//    MARK: - Properties
    
    var title: String? {
        didSet {
            favoriteTitleLabel.text = title
        }
    }
    var date: String? {
        didSet {
            favoriteDateLabel.text = date
        }
    }
    var text: String? {
        didSet {
            favoriteContentLabel.text = text
        }
    }
    var isFavorite: Bool = false {
        didSet {
            favoriteButton.setImage(buttonImage, for: .normal)
        }
    }
    
//    MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearence()
    }
    
    
//    MARK: - Actions
    
    @IBAction func favoriteButtonAction(_ sender: Any) {
        didFavoritesTapped?()
        isFavorite.toggle()
    }
}

//    MARK: - Private Methods

private extension FavoriteCollectionViewCell {
    
    func configureAppearence() {
        configureFavoriteImageView()
        configureFavoriteTitleView()
        configureFavoriteDateLabel()
        configureFavoriteTextLabel()
        configureFavoriteButton()
    }
    func configureFavoriteImageView() {
        favoriteImageView.layer.cornerRadius = 12
        favoriteImageView.contentMode = .scaleAspectFill
    }
    func configureFavoriteTitleView() {
        favoriteTitleLabel.font = .systemFont(ofSize: 16)
        favoriteTitleLabel.tintColor = .surfBlack
    }
    func configureFavoriteDateLabel() {
        favoriteDateLabel.font = .systemFont(ofSize: 10)
        favoriteDateLabel.textColor = .surfGrey
    }
    func configureFavoriteTextLabel() {
        favoriteContentLabel.font = .systemFont(ofSize: 12, weight: .light)
        favoriteContentLabel.textColor = .surfBlack
        favoriteContentLabel.numberOfLines = 1
    }
    func configureFavoriteButton() {
        favoriteButton.tintColor = .surfWhite
    }
}
