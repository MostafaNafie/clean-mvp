//
//  DependencyFactory.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

protocol Factory {
    func makeMovieListVC(_ coordinator: MovieListCoordinating) -> MovieListVC
    func makeMovieDetailsVC(with id: Int) -> MovieDetailsVC
}

struct DependencyFactory: Factory {
    private let urlSessionClient = URLSessionClient()
    
    func makeMovieListVC(_ coordinator: MovieListCoordinating) -> MovieListVC {
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
    
    func makeMovieDetailsVC(with id: Int) -> MovieDetailsVC {
        let movieResponseMapper = MovieResponseMapper()
        let movieDetailsService = MovieDetailsService(client: urlSessionClient)
        let movieDetailsUseCase = MovieDetailsUseCase(networkService: movieDetailsService,
                                                      movieResponseMapper: movieResponseMapper)
        let presenter = MovieDetailsPresenter(id: id,
                                              movieDetailsUseCase: movieDetailsUseCase)
        
        let movieDetailsVC = MovieDetailsVC(presenter: presenter)
        presenter.view = movieDetailsVC
        
        return movieDetailsVC
    }
}
