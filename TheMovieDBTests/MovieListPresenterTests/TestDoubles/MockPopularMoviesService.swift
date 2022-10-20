//
//  MockPopularMoviesService.swift
//  TheMovieDBTests
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation
@testable import TheMovieDB

struct MockPopularMoviesService: PopularMoviesServicing {
    func fetchPopularMovies(page: Int, completion: @escaping (Result<MoviesResponse, Error>) -> ()) {
        let jsonData = fakePopularMoviesResponse.data(using: .utf8)!
        let response = try! JSONDecoder().decode(MoviesResponse.self, from: jsonData)
        completion(.success(response))
    }
}
