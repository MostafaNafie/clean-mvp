//
//  MovieListPresenter.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

final class MovieListPresenter {
    // MARK: - Poperties
    weak var view: MovieListView!
    
    // MARK: - Private Properties
    private let popularMoviesUseCase: PopularMoviesUseCase!
    private var popularMovies: [Movie] =  []
    
    // MARK: - Init
    init(popularMoviesUseCase: PopularMoviesUseCase) {
        self.popularMoviesUseCase = popularMoviesUseCase
    }
    
    // MARK: - Public Methods
    func fetchMovies() {
        popularMoviesUseCase.fetchMovies(page: 1) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let movies):
                    self.popularMovies = movies
                    self.view.showMovies()
                case .failure(let error):
                    print(#function, error)
            }
        }
    }
    
    func popularMoviesCount() -> Int {
        popularMovies.count
    }
    
    func popularMovie(at row: Int) -> Movie {
        popularMovies[row]
    }
}
