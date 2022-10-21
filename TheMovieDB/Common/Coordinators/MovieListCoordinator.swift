//
//  MovieListCoordinator.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit

protocol MovieListCoordinating: AnyObject {
    func navigateToMovieDetails()
}

final class MovieListCoordinator: Coordinator {
    private unowned let navigationController: UINavigationController
    private let factory: Factory
    
    required init(factory: Factory, navigationController: UINavigationController) {
        self.factory = factory
        self.navigationController = navigationController
    }
    
    func start() {
        let movieListVC = factory.makeMovieListVC(self)
        navigationController.viewControllers = [movieListVC]
    }
}

extension MovieListCoordinator: MovieListCoordinating {
    func navigateToMovieDetails() {
        let movieDetailsVC = factory.makeMovieDetailsVC()
        navigationController.pushViewController(movieDetailsVC, animated: true)
    }
}
