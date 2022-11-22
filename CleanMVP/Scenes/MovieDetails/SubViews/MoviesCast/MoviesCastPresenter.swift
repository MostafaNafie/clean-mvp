//
//  MoviesCastPresenter.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import Foundation

final class MoviesCastPresenter: BasePresenter<MoviesCastView> {
    // MARK: - Poperties
    weak var view: MoviesCastView!
    
    // MARK: - Private Properties
    private let movieCastUseCase: MovieCastUseCase
    private var actors: [Cast] = []
    private var directors: [Cast] = []
    
    // MARK: - Init
    init(movieCastUseCase: MovieCastUseCase) {
        self.movieCastUseCase = movieCastUseCase
    }
    
    // MARK: - Public Methods
    func fetchCast(for moviesIDs: [Int], completion: (() -> ())? = nil) {
        movieCastUseCase.fetchMoviesCast(for: moviesIDs) { [weak self] result in
            self?.handleCastResult(result) { completion?() }
        }
    }
    
    func actorsCount() -> Int {
        actors.count
    }
    
    func actor(at row: Int) -> Cast {
        actors[row]
    }
    
    func directorsCount() -> Int {
        directors.count
    }
    
    func director(at row: Int) -> Cast {
        directors[row]
    }
}

// MARK: - Private Helpers
private extension MoviesCastPresenter {
    func handleCastResult(_ result: Result<(actors: [Cast], directors: [Cast]), Error>, completion: (() -> ())? = nil) {
        switch result {
            case .success(let cast):
                self.actors = cast.actors
                self.directors = cast.directors
                view.showCast()
            case .failure(let error):
                view.showError(with: "\(type(of: error))", and: error.localizedDescription)
        }
        view.stopLoading()
        completion?()
    }
}
