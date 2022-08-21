//
//  PrifilePhoneTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 20.08.2022.
//

import UIKit

final class ProfilePhoneTableViewCell: UITableViewCell {
    
//    MARK: - Views

    @IBOutlet private weak var profilePhoneLabel: UILabel!
    @IBOutlet private weak var profilePhoneNumberLabel: UILabel!
    
//    MARK: - Properties
    
    var phoneLabel: String? {
        didSet {
            profilePhoneLabel.text = phoneLabel
        }
    }
    var phoneNumberLabel: String? {
        didSet {
            profilePhoneNumberLabel.text = phoneNumberLabel
        }
    }
    
//    MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearence()
    }
}

//    MARK: - Private Methods

private extension ProfilePhoneTableViewCell {
    
    func configureAppearence() {
        selectionStyle = .none
        configureProfilePhoneLabel()
        configureProfilePhoneNumberLabel()
        
    }
    func configureProfilePhoneLabel() {
        profilePhoneLabel.font = .systemFont(ofSize: 12)
        profilePhoneLabel.textColor = .surfGrey
        profilePhoneLabel.text = "Телефон"
    }
    func configureProfilePhoneNumberLabel() {
        profilePhoneNumberLabel.font = .systemFont(ofSize: 18)
        profilePhoneNumberLabel.textColor = .surfBlack
    }
}
