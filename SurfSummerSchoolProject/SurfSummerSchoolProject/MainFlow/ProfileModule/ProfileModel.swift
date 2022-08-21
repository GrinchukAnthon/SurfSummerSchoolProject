//
//  ProfileModel.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 20.08.2022.
//

import Foundation
import UIKit

final class ProfileModel {
    
    var didItemsUpdated: (() -> Void)?
    
    var items: [ProfileItemModel] = [] {
        didSet {
            didItemsUpdated?()
        }
    }
    
    func getPost() {
        if let data = UserDefaults.standard.value(forKey:"userData") as? Data {
            let userData = try? PropertyListDecoder().decode(AuthResponseModel.self, from: data)
            for _ in 0..<4 {
                guard let item = userData?.userInfo else { return }
                guard let avatar = URL(string: item.avatar ?? "") else { return }
                ImageLoader().loadImage(from: avatar) { result in
                    switch result {
                    case .success(let response):
                        DispatchQueue.main.async {
                            self.items.append(ProfileItemModel(phone: item.phone ?? "",
                                                               email: item.email ?? "",
                                                               firstName: item.firstName ?? "",
                                                               lastName: item.lastName ?? "",
                                                               avatar:  response,
                                                               city: item.city ?? "",
                                                               about: item.about ?? ""))
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}

struct ProfileItemModel {

    // MARK: - Internal Properties

    let phone: String
    let email: String
    var firstName: String
    let lastName: String
    let avatar: UIImage?
    let city: String
    let about: String
}

