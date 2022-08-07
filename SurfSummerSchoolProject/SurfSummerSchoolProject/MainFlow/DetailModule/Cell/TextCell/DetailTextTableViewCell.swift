//
//  DetailTextTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 07.08.2022.
//

import UIKit

final class DetailTextTableViewCell: UITableViewCell {

//    MARK: - View
    
    @IBOutlet private weak var contentLabel: UILabel!
    
//    MARK: - Properties
    
    var text: String? {
        didSet {
            contentLabel.text = text
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
        contentLabel.font = .systemFont(ofSize: 12, weight: .light)
        contentLabel.textColor = .black
        contentLabel.numberOfLines = 0
    }
}
