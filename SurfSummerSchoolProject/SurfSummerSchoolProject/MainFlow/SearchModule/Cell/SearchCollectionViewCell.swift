//
//  SearchCollectionViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 21.08.2022.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
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
    var imageUrlInString: String = "" {
        didSet {
            guard let url = URL(string: imageUrlInString) else {
                return
            }
            imageView.loadImage(from: url)
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

private extension SearchCollectionViewCell {
    
    func configureAppearance() {
        titleLabel.textColor = .surfBlack
        titleLabel.font = .systemFont(ofSize: 12)
        
        imageView.layer.cornerRadius = 12
        
        favoriteButton.tintColor = .surfWhite
    }
}
