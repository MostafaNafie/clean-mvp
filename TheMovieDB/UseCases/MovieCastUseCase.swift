//
//  MovieCastUseCase.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import Foundation

struct MovieCastUseCase {
    private let networkService: MovieCastServicing
    private let movieResponseMapper: MovieResponseMapper
    
    init(networkService: MovieCastServicing, movieResponseMapper: MovieResponseMapper) {
        self.networkService = networkService
        self.movieResponseMapper = movieResponseMapper
    }
    
    func fetchMovieCast(by id: Int, completion: @escaping (Result<[Cast], Error>) -> ()) {
        networkService.fetchMovieCast(by: id) { result in
            var response: Result<[Cast], Error>!
            defer { completion(response) }
            switch result {
                case .success(let castResponse):
                    let cast = castResponse.cast.map { cast in
                        Cast(name: cast.name)
                    }
                    print(cast)
                    response = .success(cast)
                case .failure(let error):
                    response = .failure(error)
            }
        }
    }
}

struct Cast {
    let name: String
}
