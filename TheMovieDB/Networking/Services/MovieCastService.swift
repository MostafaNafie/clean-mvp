//
//  MovieCastService.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import Foundation

protocol MovieCastServicing {
    typealias CastResponse = CastNetwork.Response
    
    func fetchMovieCast(by id: Int, completion: @escaping (Result<CastResponse, Error>) -> ())
}

struct MovieCastService: MovieCastServicing {
    private let client: HTTPClient
    
    public init(client: HTTPClient) {
        self.client = client
    }
    
    func fetchMovieCast(by id: Int, completion: @escaping (Result<CastResponse, Error>) -> ()) {
        let request = MovieCastRequest(id: id).buildURLRequest()
        client.perform(request) { (result: Result<CastResponse, Error>) in
            let response: Result<CastResponse, Error>
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
