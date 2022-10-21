//
//  MovieDetailsPresenter.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

final class MovieDetailsPresenter {
    // MARK: - Poperties
    weak var view: MovieDetailsView!
    
    // MARK: - Private Properties
    private let popularMoviesUseCase: PopularMoviesUseCase
    
    // MARK: - Init
    init(popularMoviesUseCase: PopularMoviesUseCase) {
        self.popularMoviesUseCase = popularMoviesUseCase
    }
    
    // MARK: - Public Methods
    func fetchMoviesDetails() {
        view.showMovieDetails()
    }
}
