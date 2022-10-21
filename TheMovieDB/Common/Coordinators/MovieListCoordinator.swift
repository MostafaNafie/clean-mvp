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
        let firstViewController = factory.makeMovieListVC(self)
        self.navigationController.viewControllers = [firstViewController]
    }
}

extension MovieListCoordinator: MovieListCoordinating {
    func navigateToMovieDetails() {
        let vc = UIViewController()
        vc.title = "Movie Title"
        vc.view.backgroundColor = .white
        navigationController.pushViewController(vc, animated: true)
    }
}
