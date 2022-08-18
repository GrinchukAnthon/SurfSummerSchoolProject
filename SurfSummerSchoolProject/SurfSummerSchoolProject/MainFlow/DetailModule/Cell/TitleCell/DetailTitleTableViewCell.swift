//
//  DetailTitleTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 07.08.2022.
//

import UIKit

final class DetailTitleTableViewCell: UITableViewCell {

//    MARK: - View
    
    @IBOutlet private weak var cartTitleLabel: UILabel!
    @IBOutlet private weak var dateLable: UILabel!
    
//    MARK: - Properties
    
    var title: String? {
        didSet {
            cartTitleLabel.text = title
        }
    }
    
    var date: String? {
        didSet {
            dateLable.text = date
        }
    }
    
//    MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearence()
    }
    
}

//MARK: - Private Methods

private extension DetailTitleTableViewCell {
    
    func configureAppearence() {
        selectionStyle = .none
        cartTitleLabel.font = .systemFont(ofSize: 16)
        dateLable.font = .systemFont(ofSize: 10)
        dateLable.textColor = .surfGrey
    }
}
