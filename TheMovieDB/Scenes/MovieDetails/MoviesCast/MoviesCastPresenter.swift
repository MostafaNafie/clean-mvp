//
//  MoviesCastPresenter.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import Foundation

final class MoviesCastPresenter {
    // MARK: - Poperties
    weak var view: MoviesCastView!
    
    // MARK: - Private Properties
    private let movieCastUseCase: MovieCastUseCase
    
    // MARK: - Init
    init(movieCastUseCase: MovieCastUseCase) {
        self.movieCastUseCase = movieCastUseCase
    }
    
    // MARK: - Public Methods
    func getCast(for moviesIDs: [Int]) {
        movieCastUseCase.fetchMoviesCast(for: moviesIDs) { [weak self] result in
            self?.handleCastResult(result)
        }
    }
}

// MARK: - Private Helpers
private extension MoviesCastPresenter {
    func handleCastResult(_ result: Result<(actors: [Cast], directors: [Cast]), Error>) {
        switch result {
            case .success(let cast):
                print(cast.actors)
                print(cast.directors)
            case .failure(let error):
                view.showError(with: "\(type(of: error))", and: error.localizedDescription)
        }
        view.stopLoading()
    }
}
