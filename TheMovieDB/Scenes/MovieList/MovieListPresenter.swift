//
//  MovieListPresenter.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

final class MovieListPresenter {
    weak var view: MovieListView!
    
    private let popularMoviesUseCase: PopularMoviesUseCase!
    
    init(popularMoviesUseCase: PopularMoviesUseCase) {
        self.popularMoviesUseCase = popularMoviesUseCase
    }
    
    func fetchMovies() {
        popularMoviesUseCase.fetchMovies(page: 1) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let movies):
                    self.view.showMovies(movies)
                case .failure(let error):
                    print(#function, error)
            }
        }
    }
}
