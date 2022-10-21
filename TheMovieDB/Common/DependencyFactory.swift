//
//  DependencyFactory.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

protocol Factory {
    func makeMovieListVC(_ coordinator: MovieListCoordinating) -> MovieListVC
}

struct DependencyFactory: Factory {
    func makeMovieListVC(_ coordinator: MovieListCoordinating) -> MovieListVC {
        let urlSessionClient = URLSessionClient()
        let moviesResponseMapper = MoviesResponseMapper()
        
        let popularMoviesService = PopularMoviesService(client: urlSessionClient)
        let popularMoviesUseCase = PopularMoviesUseCase(networkService: popularMoviesService,
                                                        moviesResponseMapper: moviesResponseMapper)
        
        let searchMoviesService = SearchMoviesService(client: urlSessionClient)
        let searchMoviesUseCase = SearchMoviesUseCase(networkService: searchMoviesService,
                                                      moviesResponseMapper: moviesResponseMapper)
        
        let presenter = MovieListPresenter(popularMoviesUseCase: popularMoviesUseCase,
                                           searchMoviesUseCase: searchMoviesUseCase,
                                           coordinator: coordinator)
        let dataSource = MovieListDataSource(presenter: presenter)
        let delegate = MovieListDelegate(presenter: presenter)
        
        let rootVC = MovieListVC(presenter: presenter, dataSource: dataSource, delegate: delegate)
        presenter.view = rootVC
        
        return rootVC
    }
}
