//
//  DependencyFactory.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

protocol Factory {
    func makeMovieListVC(_ coordinator: MovieListCoordinating) -> MovieListVC
    func makeMovieDetailsContainerVC(with id: Int) -> MovieDetailsContainerVC
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
        
        let movieListVC = MovieListVC(presenter: presenter)
        presenter.view = movieListVC
        
        return movieListVC
    }
    
    func makeMovieDetailsContainerVC(with id: Int) -> MovieDetailsContainerVC {
        let movieDetailsVC = makeMovieDetailsVC(with: id)
        let similarMoviesVC = makeSimilarMoviesVC(with: id)
        return MovieDetailsContainerVC(movieDetailsVC: movieDetailsVC,
                                       similarMoviesVC: similarMoviesVC)
    }
}

private extension DependencyFactory {
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
    
    func makeSimilarMoviesVC(with id: Int) -> SimilarMoviesVC {
        let similarMoviesService = SimilarMoviesService(client: urlSessionClient)
        let similarMoviesUseCase = SimilarMoviesUseCase(networkService: similarMoviesService,
                                                        moviesResponseMapper: moviesResponseMapper)
        let presenter = SimilarMoviesPresenter(id: id,
                                               similarMoviesUseCase: similarMoviesUseCase)
        
        let similarMoviesVC = SimilarMoviesVC(presenter: presenter)
        presenter.view = similarMoviesVC
        
        return similarMoviesVC
    }
}
