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
    private let id: Int
    private let movieDetailsUseCase: MovieDetailsUseCase
    
    // MARK: - Init
    init(id: Int, movieDetailsUseCase: MovieDetailsUseCase) {
        self.id = id
        self.movieDetailsUseCase = movieDetailsUseCase
    }
    
    // MARK: - Public Methods
    func fetchMoviesDetails() {
        view.startLoading()
        movieDetailsUseCase.fetchMovieDetails(by: id) { [weak self] result in
            self?.handleMovieResult(result)
        }
    }
}

// MARK: - Private Helpers
private extension MovieDetailsPresenter {
    func handleMovieResult(_ result: Result<MovieDetails, Error>) {
        switch result {
            case .success(let movieDetails):
                view.show(movieDetails)
            case .failure(let error):
                view.showError(with: "\(type(of: error))", and: error.localizedDescription)
        }
        view.stopLoading()
    }
}
