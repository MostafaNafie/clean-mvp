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
    private var totalPages = 0
    private var currentPage = 1
    
    // MARK: - Init
    init(popularMoviesUseCase: PopularMoviesUseCase) {
        self.popularMoviesUseCase = popularMoviesUseCase
    }
    
    // MARK: - Public Methods
    func fetchMovies(at page: Int = 1) {
        popularMoviesUseCase.fetchMovies(page: page) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let response):
                    self.totalPages = response.totalPages
                    self.popularMovies += response.movies
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
    
    /// Check if the last movie is about to be displayed to handle pagination
    /// - Parameter indexPath: The indexPath of the cell that is about to be displayed
    func reachedMovie(at row: Int) {
        // check that this is the last item
        let lastFetchedRow = popularMoviesCount() - 1
        guard lastFetchedRow == row else { return }
        // check that currentPage is less that the totalPages
        guard currentPage < totalPages else { return }
        currentPage += 1
        fetchMovies(at: currentPage)
    }
}
