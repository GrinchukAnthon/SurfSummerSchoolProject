//
//  DetailImageTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 07.08.2022.
//

import UIKit

final class DetailImageTableViewCell: UITableViewCell {

//    MARK: - View
    
    @IBOutlet private weak var cartImageView: UIImageView!
    
//    MARK: - Properties
    
    var imageUrlInString: String = "" {
        didSet {
            guard let url = URL(string: imageUrlInString) else {
                return
            }
            imageView?.loadImage(from: url)
        }
    }
    
//MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearence()
    }
}

//MARK: - Private Methods

private extension DetailImageTableViewCell {
    
    func configureAppearence() {
        selectionStyle = .none
        cartImageView.layer.cornerRadius = 12
        cartImageView.contentMode = .scaleAspectFill
    }
}
