//
//  AppDelegate.swift
//  SurfSummerSchoolProject
//
//  Created by Антон Гринчук on 03.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        runMainFlow()
        return true
    }

    func runMainFlow() {
        window?.rootViewController = TabBarConfigurator().configure()
    }
}
