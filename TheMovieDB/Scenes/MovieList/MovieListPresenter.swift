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
    private var years: [Int] =  []
    private var yearsToMovies: [Int: [Movie]] =  [:]
    
    // MARK: - Init
    init(popularMoviesUseCase: PopularMoviesUseCase) {
        self.popularMoviesUseCase = popularMoviesUseCase
    }
    
    // MARK: - Public Methods
    func fetchMovies() {
        popularMoviesUseCase.fetchMovies(page: 1) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let yearsToMovies):
                    self.years = Array(yearsToMovies.keys)
                    self.yearsToMovies = yearsToMovies
                    self.view.showMovies()
                case .failure(let error):
                    print(#function, error)
            }
        }
    }
    
    func yearsCount() -> Int {
        yearsToMovies.count
    }
    
    func year(at section: Int) -> String {
        String(years[section])
    }
    
    func popularMoviesCount(at section: Int) -> Int {
        let year = years[section]
        return yearsToMovies[year]!.count
    }
    
    func popularMovie(at section: Int, and row: Int) -> Movie {
        let year = years[section]
        return yearsToMovies[year]![row]
    }
}
