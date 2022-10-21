//
//  SearchMoviesService.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

protocol SearchMoviesServicing {
    typealias MoviesResponse = MoviesNetwork.Response
    
    func fetchMovies(by query: String, at page: Int, completion: @escaping (Result<MoviesResponse, Error>) -> ())
}

struct SearchMoviesService: SearchMoviesServicing {
    private let client: HTTPClient
    
    public init(client: HTTPClient) {
        self.client = client
    }
    
    func fetchMovies(by query: String, at page: Int, completion: @escaping (Result<MoviesResponse, Error>) -> ()) {
        let request = MoviesSearchRequest(queryItems: [
            .init(name: "query", value: String(query)),
            .init(name: "page", value: String(page))]
        ).buildURLRequest()
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
