//
//  MockPopularMoviesService.swift
//  TheMovieDBTests
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation
@testable import TheMovieDB

struct MockPopularMoviesService: PopularMoviesServicing {
    func fetchPopularMovies(at page: Int, completion: @escaping (Result<MoviesResponse, Error>) -> ()) {
        let jsonData = mockPopularMoviesResponse.data(using: .utf8)!
        let response = try! JSONDecoder().decode(MoviesResponse.self, from: jsonData)
        completion(.success(response))
    }
}

struct MockSearchMoviesService: SearchMoviesServicing {
    func fetchMovies(by query: String, at page: Int, completion: @escaping (Result<MoviesResponse, Error>) -> ()) {
        let jsonData = mockSearchMoviesResponse.data(using: .utf8)!
        let response = try! JSONDecoder().decode(MoviesResponse.self, from: jsonData)
        completion(.success(response))
    }
}

struct MockMovieDetailsService: MovieDetailsServicing {
    func fetchMovieDetails(by id: Int, completion: @escaping (Result<MovieResponse, Error>) -> ()) {
        let jsonData = mockMovieResponse.data(using: .utf8)!
        let response = try! JSONDecoder().decode(MovieResponse.self, from: jsonData)
        completion(.success(response))
    }
}

struct MockSimilarMoviesService: SimilarMoviesServicing {
    func fetchSimilarMovies(by id: Int, completion: @escaping (Result<MoviesResponse, Error>) -> ()) {
        let jsonData = mockPopularMoviesResponse.data(using: .utf8)!
        let response = try! JSONDecoder().decode(MoviesResponse.self, from: jsonData)
        completion(.success(response))
    }
}

struct MockMovieCastService: MovieCastServicing {
    func fetchMovieCast(by id: Int, completion: @escaping (Result<CastResponse, Error>) -> ()) {
        let jsonData = mockCastResponse.data(using: .utf8)!
        let response = try! JSONDecoder().decode(CastResponse.self, from: jsonData)
        completion(.success(response))
    }
}
