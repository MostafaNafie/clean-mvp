//
//  MovieDetailsPresenter.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

final class MovieDetailsPresenter: BasePresenter<MovieDetailsView> {
    // MARK: - Poperties
    weak var view: MovieDetailsView!
    
    // MARK: - Private Properties
    private let id: Int
    private let movieDetailsUseCase: MovieDetailsUseCase
    private let watchlistUseCase: WatchlistUseCase
    
    // MARK: - Init
    init(id: Int,
         movieDetailsUseCase: MovieDetailsUseCase,
         watchlistUseCase: WatchlistUseCase) {
        self.id = id
        self.movieDetailsUseCase = movieDetailsUseCase
        self.watchlistUseCase = watchlistUseCase
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        fetchMoviesDetails()
    }
    
    func watchlistButtonTapped() {
        if watchlistUseCase.containsMovie(with: id) {
            watchlistUseCase.removeMovie(with: id)
        } else {
            watchlistUseCase.addMovie(with: id)
        }
    }
}

// MARK: - Private Helpers
private extension MovieDetailsPresenter {
    func fetchMoviesDetails() {
        view.startLoading()
        movieDetailsUseCase.fetchMovieDetails(by: id) { [weak self] result in
            self?.handleMovieResult(result)
        }
    }
    
    func handleMovieResult(_ result: Result<MovieDetails, Error>) {
        switch result {
            case .success(var movieDetails):
                movieDetails.isAddedToWatchlist = watchlistUseCase.containsMovie(with: id)
                view.show(movieDetails)
            case .failure(let error):
                view.showError(with: "\(type(of: error))", and: error.localizedDescription)
        }
        view.stopLoading()
    }
}
