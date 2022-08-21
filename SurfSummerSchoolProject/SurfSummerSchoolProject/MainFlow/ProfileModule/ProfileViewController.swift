//
//  ProfileViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 03.08.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    
//    MARK: - Views
    
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var profileButtonOutlet: UIButton!
    
//    MARK: - Properties
    
    private let model: ProfileModel = .init()
    
//    MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        
        
        model.didItemsUpdated = { [weak self] in
            self?.profileTableView.reloadData()
        }
        model.getPost()
    }
    
//    MARK: - Actions
    @IBAction func profileButtonAction(_ sender: Any) {
        navigationController?.pushViewController(AuthorizationViewController(), animated: true)
    }
}

//    MARK: - Private Methods

private extension ProfileViewController {
    
    func configureApperance() {
        configureProfileTableView()
        configureNavigationBar()
        configureProfileButtonOutlet()
    }
    func configureProfileTableView() {
        profileTableView.separatorStyle = .none
        profileTableView.customRegister(ProfileImageTableViewCell.self)
        profileTableView.customRegister(ProfileCityTableViewCell.self)
        profileTableView.customRegister(ProfilePhoneTableViewCell.self)
        profileTableView.customRegister(ProfileEmailTableViewCell.self)
        profileTableView.dataSource = self
    }
    func configureNavigationBar() {
        navigationItem.title = "Профиль"
    }
    func configureProfileButtonOutlet() {
        profileButtonOutlet.backgroundColor = .surfBlack
        profileButtonOutlet.tintColor = .surfWhite
        profileButtonOutlet.setTitle("Выйти", for: .normal)
    }
}

//    MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = model.items[indexPath.row]
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(ProfileImageTableViewCell.self)",
                for: indexPath
            ) as? ProfileImageTableViewCell else { return UITableViewCell() }
            cell.image = item.avatar
            cell.firstNameLabel = item.firstName
            cell.lastNameLabel = item.lastName
            cell.aboutLabel = item.about
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(ProfileCityTableViewCell.self)",
                for: indexPath
            ) as? ProfileCityTableViewCell else { return UITableViewCell() }
            cell.cityNameLabel = item.city
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(ProfilePhoneTableViewCell.self)",
                for: indexPath
            ) as? ProfilePhoneTableViewCell else { return UITableViewCell() }
            cell.phoneNumberLabel = item.phone
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(ProfileEmailTableViewCell.self)",
                for: indexPath
            ) as? ProfileEmailTableViewCell else { return UITableViewCell() }
            cell.emailAddressLabel = item.email
            return cell
        default:
            return UITableViewCell()
        }
    }
}
