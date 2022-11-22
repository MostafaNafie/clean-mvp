//
//  SearchMoviesUseCase.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

final class SearchMoviesUseCase {
    private let networkService: SearchMoviesServicing
    private let moviesResponseMapper: MoviesResponseMapper
    
    init(networkService: SearchMoviesServicing, moviesResponseMapper: MoviesResponseMapper) {
        self.networkService = networkService
        self.moviesResponseMapper = moviesResponseMapper
    }
    
    func fetchMovies(by query: String, at page: Int, completion: @escaping (Result<(totalPages: Int, movies: [Movie]), Error>) -> ()) {
        networkService.fetchMovies(by: query, at: page) { [weak self] result in
            guard let self = self else { return }
            var response: Result<(totalPages: Int, movies: [Movie]), Error>!
            defer { completion(response) }
            switch result {
                case .success(let moviesResponse):
                    let movies = self.moviesResponseMapper.mapResponseToMovies(moviesResponse)
                    response = .success((moviesResponse.totalPages, movies))
                case .failure(let error):
                    response = .failure(error)
            }
        }
    }
}
