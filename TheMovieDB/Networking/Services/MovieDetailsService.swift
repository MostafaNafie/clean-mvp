//
//  MovieDetailsService.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

protocol MovieDetailsServicing {
    typealias MoviesResponse = MoviesNetwork.Movie
    
    func fetchMovieDetails(by id: Int, completion: @escaping (Result<MoviesResponse, Error>) -> ())
}

struct MovieDetailsService: MovieDetailsServicing {
    private let client: HTTPClient
    
    public init(client: HTTPClient) {
        self.client = client
    }
    
    func fetchMovieDetails(by id: Int, completion: @escaping (Result<MoviesResponse, Error>) -> ()) {
        let request = MovieDetailsRequest(id: id).buildURLRequest()
        client.perform(request) { (result: Result<MoviesResponse, Error>) in
            let response: Result<MoviesResponse, Error>
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
