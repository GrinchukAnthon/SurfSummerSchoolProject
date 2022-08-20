//
//  DetailTextTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 19.08.2022.
//

import UIKit

final class DetailTextTableViewCell: UITableViewCell {

//    MARK: - View
    
    @IBOutlet weak var detailContentLabel: UILabel!
    
//    MARK: - Properties
    
    var text: String? {
        didSet {
            detailContentLabel.text = text
        }
    }
    
//    MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearence()
    }
}

//MARK: - Private Methods

private extension DetailTextTableViewCell {
    
    func configureAppearence() {
        selectionStyle = .none
        detailContentLabel.font = .systemFont(ofSize: 12, weight: .light)
        detailContentLabel.textColor = .surfBlack
        detailContentLabel.numberOfLines = 0
    }
}
