//
//  DetailViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 07.08.2022.
//

import UIKit

final class DetailViewController: UIViewController {

//    MARK: - View
    
    @IBOutlet private weak var detailTableView: UITableView!
    
//    MARK: - Properties
    
    var model: DetailItemModel?
    
//    MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        detailTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createBackArrowButtonInNavBar()
    }
}

//MARK: - Private Methods

private extension DetailViewController {
    
    func configureAppearance() {
        configureDetailTableView()
        configureNavigationBar()
    }
    
    func configureDetailTableView() {
        detailTableView.separatorStyle = .none
        detailTableView.customRegister(DetailImageTableViewCell.self)
        detailTableView.customRegister(DetailTitleTableViewCell.self)
        detailTableView.customRegister(DetailTextTableViewCell.self)
        detailTableView.dataSource = self
    }
    
    func configureNavigationBar() {
        navigationItem.title = model?.title
    }
}

//MARK: - UITableViewDataSource

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(DetailImageTableViewCell.self)",
                for: indexPath
            ) as? DetailImageTableViewCell else { return UITableViewCell() }
            cell.imageUrlInString = model?.imageUrlInString ?? ""
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(DetailTitleTableViewCell.self)",
                for: indexPath
            ) as? DetailTitleTableViewCell else { return UITableViewCell() }
            cell.title = model?.title ?? ""
            cell.date = model?.dateCreation ?? ""
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(DetailTextTableViewCell.self)",
                for: indexPath
            ) as? DetailTextTableViewCell else { return UITableViewCell() }
            cell.text = model?.content
            return cell
        default:
            return UITableViewCell()
        }
    }
}
