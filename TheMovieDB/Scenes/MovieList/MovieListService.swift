//
//  MovieListService.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

protocol MovieListServicing {
    func fetchMovies(completion: () -> ())
}

struct MovieListService: MovieListServicing {
    func fetchMovies(completion: () -> ()) {
        completion()
    }
}
