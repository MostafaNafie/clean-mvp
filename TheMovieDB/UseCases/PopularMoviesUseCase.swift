//
//  PopularMoviesUseCase.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

struct PopularMoviesUseCase {
    private let networkService: PopularMoviesServicing
    private let moviesResponseMapper: MoviesResponseMapper
    
    init(networkService: PopularMoviesServicing, moviesResponseMapper: MoviesResponseMapper) {
        self.networkService = networkService
        self.moviesResponseMapper = moviesResponseMapper
    }
    
    func fetchMovies(at page: Int, completion: @escaping (Result<(totalPages: Int, movies: [Movie]), Error>) -> ()) {
        networkService.fetchPopularMovies(at: page) { result in
            var response: Result<(totalPages: Int, movies: [Movie]), Error>!
            defer { completion(response) }
            switch result {
                case .success(let moviesResponse):
                    let movies = moviesResponseMapper.mapResponseToMovies(moviesResponse)
                    response = .success((moviesResponse.totalPages, movies))
                case .failure(let error):
                    response = .failure(error)
            }
        }
    }
}
