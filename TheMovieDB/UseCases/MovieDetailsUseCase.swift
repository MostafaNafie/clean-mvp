//
//  MovieDetailsUseCase.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

struct MovieDetailsUseCase {
    private let networkService: MovieDetailsServicing
    private let movieResponseMapper: MovieResponseMapper
    
    init(networkService: MovieDetailsServicing, movieResponseMapper: MovieResponseMapper) {
        self.networkService = networkService
        self.movieResponseMapper = movieResponseMapper
    }
    
    func fetchMovieDetails(by id: Int, completion: @escaping (Result<MovieDetails, Error>) -> ()) {
        networkService.fetchMovieDetails(by: id) { result in
            var response: Result<MovieDetails, Error>!
            defer { completion(response) }
            switch result {
                case .success(let movieResponse):
                    let movieDetails = movieResponseMapper.mapResponseToMovieDetails(movieResponse)
                    response = .success(movieDetails)
                case .failure(let error):
                    response = .failure(error)
            }
        }
    }
}
