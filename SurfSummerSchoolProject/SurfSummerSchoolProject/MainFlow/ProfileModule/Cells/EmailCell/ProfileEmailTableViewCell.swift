//
//  ProfileEmailTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 20.08.2022.
//

import UIKit

final class ProfileEmailTableViewCell: UITableViewCell {
    
//    MARK: - Views
    
    @IBOutlet private weak var profileEmailLabel: UILabel!
    @IBOutlet private weak var profileEmailAddressLabel: UILabel!
    
//    MARK: - Properties
    
    var emailLabel: String? {
        didSet {
            profileEmailLabel.text = emailLabel
        }
    }
    var emailAddressLabel: String? {
        didSet {
            profileEmailAddressLabel.text = emailAddressLabel
        }
    }
    
//    MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearence()
    }
}

//    MARK: - Private Methods

private extension ProfileEmailTableViewCell {
    
    func configureAppearence() {
        selectionStyle = .none
        configureProfileEmailLabel()
        configureProfileEmailAddressLabel()
        
    }
    func configureProfileEmailLabel() {
        profileEmailLabel.font = .systemFont(ofSize: 12)
        profileEmailLabel.textColor = .surfGrey
        profileEmailLabel.text = "Почта"
    }
    func configureProfileEmailAddressLabel() {
        profileEmailAddressLabel.font = .systemFont(ofSize: 18)
        profileEmailAddressLabel.textColor = .surfBlack
    }
}
