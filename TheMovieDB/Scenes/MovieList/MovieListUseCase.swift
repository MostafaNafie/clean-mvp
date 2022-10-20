//
//  MovieListUseCase.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

struct MovieListUseCase {
    private let networkService: MovieListServicing
    
    init(networkService: MovieListServicing) {
        self.networkService = networkService
    }
    
    func fetchMovies(completion: () -> ()) {
        networkService.fetchMovies() {
            completion()
        }
    }
}
