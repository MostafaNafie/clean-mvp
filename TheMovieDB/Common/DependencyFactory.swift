//
//  DependencyFactory.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

protocol Factory {
    func makeMovieListVC(_ coordinator: MovieListCoordinating) -> MovieListVC
    func makeMovieDetailsVC() -> MovieDetailsVC
}

struct DependencyFactory: Factory {
    private let urlSessionClient = URLSessionClient()
    private let moviesResponseMapper = MoviesResponseMapper()
    
    func makeMovieListVC(_ coordinator: MovieListCoordinating) -> MovieListVC {
        
        let popularMoviesService = PopularMoviesService(client: urlSessionClient)
        let popularMoviesUseCase = PopularMoviesUseCase(networkService: popularMoviesService,
                                                        moviesResponseMapper: moviesResponseMapper)
        
        let searchMoviesService = SearchMoviesService(client: urlSessionClient)
        let searchMoviesUseCase = SearchMoviesUseCase(networkService: searchMoviesService,
                                                      moviesResponseMapper: moviesResponseMapper)
        
        let presenter = MovieListPresenter(popularMoviesUseCase: popularMoviesUseCase,
                                           searchMoviesUseCase: searchMoviesUseCase,
                                           coordinator: coordinator)
        let tableViewDataSource = MovieListTableViewDataSource(presenter: presenter)
        let tableViewDelegate = MovieListTableViewDelegate(presenter: presenter)
        let searchBarDelegate = MovieListSearchBarDelegate(presenter: presenter)
        
        let movieListVC = MovieListVC(presenter: presenter,
                                      tableViewDataSource: tableViewDataSource,
                                      tableViewDelegate: tableViewDelegate,
                                      searchBarDelegate: searchBarDelegate)
        presenter.view = movieListVC
        
        return movieListVC
    }
    
    func makeMovieDetailsVC() -> MovieDetailsVC {
        let movieDetailsService = PopularMoviesService(client: urlSessionClient)
        let movieDetailsUseCase = PopularMoviesUseCase(networkService: movieDetailsService,
                                                       moviesResponseMapper: moviesResponseMapper)
        let presenter = MovieDetailsPresenter(popularMoviesUseCase: movieDetailsUseCase)
        
        let movieDetailsVC = MovieDetailsVC(presenter: presenter)
        presenter.view = movieDetailsVC
        
        return movieDetailsVC
    }
}
