//
//  SimilarMoviesUseCase.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 22/10/2022.
//

import Foundation

final class SimilarMoviesUseCase {
    private let networkService: SimilarMoviesServicing
    private let moviesResponseMapper: MoviesResponseMapper
    
    init(networkService: SimilarMoviesServicing, moviesResponseMapper: MoviesResponseMapper) {
        self.networkService = networkService
        self.moviesResponseMapper = moviesResponseMapper
    }
    
    func fetchSimilarMovies(by id: Int, completion: @escaping (Result<[Movie], Error>) -> ()) {
        networkService.fetchSimilarMovies(by: id) { [weak self] result in
            guard let self = self else { return }
            var response: Result<[Movie], Error>!
            defer { completion(response) }
            switch result {
                case .success(let moviesResponse):
                    let movies = self.moviesResponseMapper.mapResponseToMovies(moviesResponse)
                    response = .success(Array(movies.prefix(5)))
                case .failure(let error):
                    response = .failure(error)
            }
        }
    }
}
