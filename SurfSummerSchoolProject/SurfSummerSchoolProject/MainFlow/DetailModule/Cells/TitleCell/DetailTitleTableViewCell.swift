//
//  DetailTitleTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 07.08.2022.
//

import UIKit

final class DetailTitleTableViewCell: UITableViewCell {

//    MARK: - View
    
    @IBOutlet private weak var detailTitleLabel: UILabel!
    @IBOutlet private weak var detailDateLable: UILabel!
    
//    MARK: - Properties
    
    var title: String? {
        didSet {
            detailTitleLabel.text = title
        }
    }
    
    var date: String? {
        didSet {
            detailDateLable.text = date
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
        detailTitleLabel.font = .systemFont(ofSize: 16)
        detailDateLable.font = .systemFont(ofSize: 10)
        detailDateLable.textColor = .surfGrey
    }
}
