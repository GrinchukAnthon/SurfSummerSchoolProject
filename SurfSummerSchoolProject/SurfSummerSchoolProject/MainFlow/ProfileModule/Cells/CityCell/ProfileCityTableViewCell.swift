//
//  PrifileCityTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 20.08.2022.
//

import UIKit

final class ProfileCityTableViewCell: UITableViewCell {
    
//    MARK: - Views

    @IBOutlet private weak var profileCityLabel: UILabel!
    @IBOutlet private weak var profileCityNameLabel: UILabel!
    
//    MARK: - Properties
    
    var cityLabel: String? {
        didSet {
            profileCityLabel.text = cityLabel
        }
    }
    var cityNameLabel: String? {
        didSet {
            profileCityNameLabel.text = cityNameLabel
        }
    }
    
//    MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearence()
    }
}

//    MARK: - Private Methods

private extension ProfileCityTableViewCell {
    
    func configureAppearence() {
        selectionStyle = .none
        configureProfileCityLabel()
        configureProfileCityNameLabel()
        
    }
    func configureProfileCityLabel() {
        profileCityLabel.font = .systemFont(ofSize: 12)
        profileCityLabel.textColor = .surfGrey
        profileCityLabel.text = "Город"
    }
    func configureProfileCityNameLabel() {
        profileCityNameLabel.font = .systemFont(ofSize: 18)
        profileCityNameLabel.textColor = .surfBlack
    }
}
