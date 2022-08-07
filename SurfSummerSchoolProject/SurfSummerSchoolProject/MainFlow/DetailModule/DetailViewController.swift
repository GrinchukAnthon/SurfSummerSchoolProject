//
//  DetailViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 07.08.2022.
//

import UIKit

final class DetailViewController: UIViewController, UIGestureRecognizerDelegate {

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
        configureNavigationBar()
    }
}

//MARK: - Private Methods

private extension DetailViewController {
    
    func configureAppearance() {
        configureDetailTableView()
    }
    
    func configureDetailTableView() {
        detailTableView.separatorStyle = .none
        detailTableView.register(UINib(nibName: "\(DetailImageTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(DetailImageTableViewCell.self)")
        detailTableView.register(UINib(nibName: "\(DetailTitleTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(DetailTitleTableViewCell.self)")
        detailTableView.register(UINib(nibName: "\(DetailTextTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(DetailTextTableViewCell.self)")
        detailTableView.dataSource = self
    }
    
    func configureNavigationBar() {
        navigationItem.title = model?.title
        let backButton = UIBarButtonItem(image: UIImage(named: "back-arrow"),
                                         style: .plain,
                                         target: navigationController,
                                         action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.interactivePopGestureRecognizer?.delegate = self
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailImageTableViewCell.self)")
            if let cell = cell as? DetailImageTableViewCell {
                cell.image = model?.image
            }
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailTitleTableViewCell.self)")
            if let cell = cell as? DetailTitleTableViewCell {
                cell.title = model?.title ?? ""
                cell.date = model?.dateCreation ?? ""
            }
            return cell ?? UITableViewCell()
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailTextTableViewCell.self)")
            if let cell = cell as? DetailTextTableViewCell {
                cell.text = model?.content
            }
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}
