//
//  AuthorizationViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 21.08.2022.
//

import UIKit

final class AuthorizationViewController: UIViewController {
    
//    MARK: - Views
    
    @IBOutlet private weak var autorizationNBLabel: UILabel!
    @IBOutlet private weak var authorizationTableView: UITableView!
    @IBOutlet private weak var authorizationButtonOutlet: UIButton!
    
//    MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        configureApperence()
    }
    
//    MARK: - Actions
    
    @IBAction private func authorizationButtonActions(_ sender: Any) {
        navigationController?.pushViewController(TabBarConfigurator().configure(), animated: true)
    }
}

//    MARK: - Private Methods

private extension AuthorizationViewController {
    
    func configureApperence() {
        configureAutorizationNBLabel()
        configureAuthorizationButtonOutlet()
        configureAuthorizationTableView()
        configureNavigationBar()
        
    }
    func configureAuthorizationButtonOutlet() {
        autorizationNBLabel.text = "Вход"
        autorizationNBLabel.font = .systemFont(ofSize: 18, weight: .medium)
    }
    func configureAutorizationNBLabel() {
        authorizationButtonOutlet.backgroundColor = .surfBlack
        authorizationButtonOutlet.tintColor = .surfWhite
        authorizationButtonOutlet.setTitle("Войти", for: .normal)
    }
    func configureAuthorizationTableView() {
        authorizationTableView.separatorStyle = .none
        authorizationTableView.customRegister(AuthorizationLoginTableViewCell.self)
        authorizationTableView.customRegister(AuthorizationPasswordTableViewCell.self)
        authorizationTableView.dataSource = self
    }
    func configureNavigationBar() {
        
        navigationItem.title = "Вход"
    }
}

//    MARK: - UITableViewDataSource

extension AuthorizationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let item = model.items[indexPath.row]
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(AuthorizationLoginTableViewCell.self)",
                for: indexPath
            ) as? AuthorizationLoginTableViewCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(AuthorizationPasswordTableViewCell.self)",
                for: indexPath
            ) as? AuthorizationPasswordTableViewCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
}
