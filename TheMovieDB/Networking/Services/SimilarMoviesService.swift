//
//  SimilarMoviesService.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 22/10/2022.
//

import Foundation

protocol SimilarMoviesServicing {
    typealias MoviesResponse = MoviesNetwork.Response
    
    func fetchSimilarMovies(by id: Int, completion: @escaping (Result<MoviesResponse, Error>) -> ())
}

struct SimilarMoviesService: SimilarMoviesServicing {
    private let client: HTTPClient
    
    public init(client: HTTPClient) {
        self.client = client
    }
    
    func fetchSimilarMovies(by id: Int, completion: @escaping (Result<MoviesResponse, Error>) -> ()) {
        let request = SimilarMoviesRequest(id: id).buildURLRequest()
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
