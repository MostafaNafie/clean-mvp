//
//  MoviesCastPresenter.swift
//  TheMovieDB
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
    
    // MARK: - Init
    init(movieCastUseCase: MovieCastUseCase) {
        self.movieCastUseCase = movieCastUseCase
    }
    
    // MARK: - Public Methods
    func fetchCast(for moviesIDs: [Int]) {
        movieCastUseCase.fetchMoviesCast(for: moviesIDs) { [weak self] result in
            self?.handleCastResult(result)
        }
    }
    
    func actorsCount() -> Int {
        actors.count
    }
    
    func actor(at row: Int) -> Cast {
        actors[row]
    }
}

// MARK: - Private Helpers
private extension MoviesCastPresenter {
    func handleCastResult(_ result: Result<(actors: [Cast], directors: [Cast]), Error>) {
        switch result {
            case .success(let cast):
                self.actors = cast.actors
                print(cast.directors)
                view.showCast()
            case .failure(let error):
                view.showError(with: "\(type(of: error))", and: error.localizedDescription)
        }
        view.stopLoading()
    }
}
