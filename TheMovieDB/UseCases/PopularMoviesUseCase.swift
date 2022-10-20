//
//  PopularMoviesUseCase.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

struct PopularMoviesUseCase {
    private let networkService: PopularMoviesServicing
    
    init(networkService: PopularMoviesServicing) {
        self.networkService = networkService
    }
    
    func fetchMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> ()) {
        networkService.fetchPopularMovies(page: page) { result in
            var response: Result<[Movie], Error>!
            defer { completion(response) }
            switch result {
                case .success(let moviesResponse):
                    let movies: [Movie] = moviesResponse.results.compactMap {
                        .init(title: $0.title,
                              overview: $0.overview)
                    }
                    response = .success(movies)
                case .failure(let error):
                    response = .failure(error)
            }
        }
    }
}
