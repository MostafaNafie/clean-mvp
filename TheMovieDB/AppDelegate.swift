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
        let popularMoviesService = PopularMoviesService(client: URLSessionClient())
        let popularMoviesUseCase = PopularMoviesUseCase(networkService: popularMoviesService)
        let presenter = MovieListPresenter(popularMoviesUseCase: popularMoviesUseCase)
        let dataSource = MovieListDataSource(presenter: presenter)
        let delegate = MovieListDelegate(presenter: presenter)
        let rootVC = MovieListVC(presenter: presenter, dataSource: dataSource, delegate: delegate)
        presenter.view = rootVC
        
        let rootNavigationController = UINavigationController(rootViewController: rootVC)
        rootNavigationController.navigationBar.prefersLargeTitles = true
        
        window = UIWindow()
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
        return true
    }
}

