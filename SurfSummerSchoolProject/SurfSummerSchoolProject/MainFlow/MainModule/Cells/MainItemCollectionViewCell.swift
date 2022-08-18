//
//  MainItemCollectionViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 04.08.2022.
//

import UIKit

class MainItemCollectionViewCell: UICollectionViewCell {
    
//    MARK: - Constants
    
    private enum Constants {
        static let fillHeartImage = UIImage(assetIdentifier: .heartFill)
        static let heartImage = UIImage(assetIdentifier: .heart)
    }
    
//    MARK: - Views
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    
//    MARK: - Events
    
    var didFavoritesTapped: (() -> Void)?
    
//    MARK: - Calculated
    
    var buttonImage: UIImage? {
        return isFavorite ? Constants.heartImage : Constants.fillHeartImage
    }
    
//    MARK: - Animate
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0) {
                self.contentView.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.95, y: 0.95) : .identity
            }
        }
    }
    
//    MARK: - Properties
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    var image: UIImage? {
        didSet {
            imageView.image = image
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
        configureAppearance()
    }
    
//    MARK: - Actions
    
    @IBAction private func favoriteAction(_ sender: Any) {
        didFavoritesTapped?()
        isFavorite.toggle()
    }
}

//MARK: - Private Methods

private extension MainItemCollectionViewCell {
    
    func configureAppearance() {
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 12)
        
        imageView.layer.cornerRadius = 12
        
        favoriteButton.tintColor = .white
    }
}
