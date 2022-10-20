//
//  MovieListService.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

protocol PopularMoviesServicing {
    typealias MoviesResponse = MoviesNetwork.Response
    
    func fetchPopularMovies(page: Int, completion: @escaping (Result<MoviesResponse, Error>) -> ())
}

struct PopularMoviesService: PopularMoviesServicing {
    private let client: HTTPClient
    
    public init(client: HTTPClient) {
        self.client = client
    }
    
    func fetchPopularMovies(page: Int, completion: @escaping (Result<MoviesResponse, Error>) -> ()) {
        let request = MoviesRequest(queryItems: [.init(name: "page", value: String(page))]).buildURLRequest()
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
