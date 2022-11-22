//
//  MovieListCoordinator.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit

protocol MovieListCoordinating: AnyObject {
    func navigateToMovieDetails(with id: Int)
}

final class MovieListCoordinator: Coordinator {
    // MARK: - Properties
    private let window = UIWindow()
    private let factory: Factory
    private let navigationController: UINavigationController
    
    // MARK: - Init
    required init(factory: Factory, navigationController: UINavigationController = UINavigationController()) {
        self.factory = factory
        self.navigationController = navigationController
    }
    
    // MARK: - Public Methods
    func start() {
        let movieListVC = factory.makeMovieListVC(self)
        navigationController.viewControllers = [movieListVC]
        navigationController.navigationBar.prefersLargeTitles = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

extension MovieListCoordinator: MovieListCoordinating {
    func navigateToMovieDetails(with id: Int) {
        let movieDetailsContainerVC = factory.makeMovieDetailsContainerVC(with: id)
        navigationController.pushViewController(movieDetailsContainerVC, animated: true)
    }
}
