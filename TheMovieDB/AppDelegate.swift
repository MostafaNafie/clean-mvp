//
//  AppDelegate.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootNavigationController = UINavigationController()
        rootNavigationController.navigationBar.prefersLargeTitles = true
        
        let coordinator = MovieListCoordinator(navigationController: rootNavigationController)
        coordinator.start()
        window = UIWindow()
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
        return true
    }
}

