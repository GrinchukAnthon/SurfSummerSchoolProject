//
//  ProfileImageTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 20.08.2022.
//

import UIKit

final class ProfileImageTableViewCell: UITableViewCell {
    
//    MARK: - Views

    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var profileFirstNameLabel: UILabel!
    @IBOutlet private weak var profileLastNameLabel: UILabel!
    @IBOutlet private weak var profileAboutLabel: UILabel!
    
//    MARK: - Properties
    
    var image: UIImage? {
        didSet {
            profileImageView.image = image
        }
    }
    var firstNameLabel: String? {
        didSet {
            profileFirstNameLabel.text = firstNameLabel
        }
    }
    var lastNameLabel: String? {
        didSet {
            profileLastNameLabel.text = lastNameLabel
        }
    }
    var aboutLabel: String? {
        didSet {
            profileAboutLabel.text = aboutLabel
        }
    }
    
//    MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearence()
    }
}

//    MARK: - Private Methods

private extension ProfileImageTableViewCell {
    
    func configureAppearence() {
        selectionStyle = .none
        configureProfileImageView()
        configureProfileFirstNameLabel()
        configureProfileLastNameLabel()
        configureProfileAboutLabel()
    }
    func configureProfileImageView() {
        profileImageView.layer.cornerRadius = 12
        profileImageView.contentMode = .scaleAspectFill
    }
    func configureProfileFirstNameLabel() {
        profileFirstNameLabel.font = .systemFont(ofSize: 18)
        profileFirstNameLabel.textColor = .surfBlack
    }
    func configureProfileLastNameLabel() {
        profileLastNameLabel.font = .systemFont(ofSize: 18)
        profileLastNameLabel.textColor = .surfBlack
    }
    func configureProfileAboutLabel() {
        profileAboutLabel.font = .systemFont(ofSize: 12)
        profileAboutLabel.textColor = .surfGrey
        profileAboutLabel.numberOfLines = 4
    }
}
