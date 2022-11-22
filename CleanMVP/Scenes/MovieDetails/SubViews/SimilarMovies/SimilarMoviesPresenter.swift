//
//  SimilarMoviesPresenter.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

final class SimilarMoviesPresenter: BasePresenter<SimilarMoviesView> {
    // MARK: - Poperties
    weak var view: SimilarMoviesView!
    
    // MARK: - Private Properties
    private let id: Int
    private let similarMoviesUseCase: SimilarMoviesUseCase
    private var movies: [Movie] =  []
    
    // MARK: - Init
    init(id: Int, similarMoviesUseCase: SimilarMoviesUseCase) {
        self.id = id
        self.similarMoviesUseCase = similarMoviesUseCase
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        fetchMoviesDetails()
    }
    
    // MARK: - Public Methods
    func moviesCount() -> Int {
        movies.count
    }
    
    func movie(at row: Int) -> Movie {
        movies[row]
    }
}

// MARK: - Private Helpers
private extension SimilarMoviesPresenter {
    func fetchMoviesDetails() {
        view.startLoading()
        similarMoviesUseCase.fetchSimilarMovies(by: id) { [weak self] result in
            self?.handleMoviesResult(result)
        }
    }
    
    func handleMoviesResult(_ result: Result<[Movie], Error>) {
        switch result {
            case .success(let movies):
                self.movies = movies
                view.showMovies()
                let moviesIDs = movies.map { $0.id }
                view.fetchCast(for: moviesIDs)
            case .failure(let error):
                view.showError(with: "\(type(of: error))", and: error.localizedDescription)
        }
        view.stopLoading()
    }
}
