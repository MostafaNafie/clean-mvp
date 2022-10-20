//
//  MovieListPresenter.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

final class MovieListPresenter {
    weak var view: MovieListView!
    
    private let movieListUseCase: MovieListUseCase!
    
    init(movieListUseCase: MovieListUseCase) {
        self.movieListUseCase = movieListUseCase
    }
    
    func fetchMovies() {
        movieListUseCase.fetchMovies {
            view.showMovies()
        }
    }
}
