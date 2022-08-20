//
//  TabBarConfigurator.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 04.08.2022.
//

import UIKit

final class TabBarConfigurator {
    
//   MARK: - Private Properties
    
    private let allTab: [TabBarModel] = [.main, .favorite, .profile]
    
//    MARK: - Internal func
    
    func configure() -> UITabBarController {
        return getTabBarController()
    }
}

//MARK: - Private Methods

private extension TabBarConfigurator {
    
    func getTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .surfBlack
        tabBarController.tabBar.unselectedItemTintColor = .surfGrey
        tabBarController.tabBar.backgroundColor = .surfWhite
        tabBarController.viewControllers = getControllers()
        return tabBarController
    }
    
    func getControllers() -> [UIViewController] {
        var viewControllers = [UIViewController]()
        
        allTab.forEach { tab in
            let controller = getCurrentViewController(tab: tab)
            let navigationController = UINavigationController(rootViewController: controller)
            let tabBarItem = UITabBarItem (title: tab.title,
                                           image: tab.image,
                                           selectedImage: tab.selectedImage)
            controller.tabBarItem = tabBarItem
            viewControllers.append(navigationController)
        }
        return viewControllers
    }
    
    func getCurrentViewController(tab: TabBarModel) -> UIViewController {
        switch tab {
        case .main:
            return MainViewController()
        case .favorite:
            return FavoriteViewController()
        case .profile:
            return ProfileViewController()
        }
    }
}
