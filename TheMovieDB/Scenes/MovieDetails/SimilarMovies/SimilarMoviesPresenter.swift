//
//  SimilarMoviesPresenter.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

final class SimilarMoviesPresenter {
    // MARK: - Poperties
    weak var view: SimilarMoviesView!
    
    // MARK: - Private Properties
    private let id: Int
    private let similarMoviesUseCase: SimilarMoviesUseCase
    
    // MARK: - Init
    init(id: Int, similarMoviesUseCase: SimilarMoviesUseCase) {
        self.id = id
        self.similarMoviesUseCase = similarMoviesUseCase
    }
    
    // MARK: - Public Methods
    func fetchMoviesDetails() {
        view.startLoading()
        similarMoviesUseCase.fetchSimilarMovies(by: id) { [weak self] result in
            self?.handleMoviesResult(result)
        }
    }
}

// MARK: - Private Helpers
private extension SimilarMoviesPresenter {
    func handleMoviesResult(_ result: Result<[Movie], Error>) {
        switch result {
            case .success(let movies):
                print(movies.prefix(5))
//                view.show(movieDetails)
            case .failure(let error):
                view.showError(with: "\(type(of: error))", and: error.localizedDescription)
        }
        view.stopLoading()
    }
}
