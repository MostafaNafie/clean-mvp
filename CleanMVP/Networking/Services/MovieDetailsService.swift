//
//  MovieDetailsService.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

protocol MovieDetailsServicing {
    typealias MovieResponse = MoviesNetwork.Movie
    
    func fetchMovieDetails(by id: Int, completion: @escaping (Result<MovieResponse, Error>) -> ())
}

struct MovieDetailsService: MovieDetailsServicing {
    private let client: HTTPClient
    
    public init(client: HTTPClient) {
        self.client = client
    }
    
    func fetchMovieDetails(by id: Int, completion: @escaping (Result<MovieResponse, Error>) -> ()) {
        let request = MovieDetailsRequest(id: id).buildURLRequest()
        client.perform(request) { (result: Result<MovieResponse, Error>) in
            let response: Result<MovieResponse, Error>
            defer { completion(response) }
            switch result {
                case .success(let moviesResponse):
                    response = .success(moviesResponse)
                case .failure(let error):
                    response  = .failure(error)
            }
        }
    }
}
