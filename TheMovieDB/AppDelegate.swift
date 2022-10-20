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
        let rootVC = ViewController()
        window = UIWindow()
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        return true
    }
}

