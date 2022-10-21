//
//  PopularMoviesUseCase.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

struct PopularMoviesUseCase {
    private let networkService: PopularMoviesServicing
    
    init(networkService: PopularMoviesServicing) {
        self.networkService = networkService
    }
    
    func fetchMovies(page: Int, completion: @escaping (Result<[Int: [Movie]], Error>) -> ()) {
        networkService.fetchPopularMovies(page: page) { result in
            var response: Result<[Int: [Movie]], Error>!
            defer { completion(response) }
            switch result {
                case .success(let moviesResponse):
                    let movies = mapResponseToMovies(moviesResponse)
                    let yearsToMovies = groupMoviesByYear(movies)
                    response = .success(yearsToMovies)
                case .failure(let error):
                    response = .failure(error)
            }
        }
    }
}

private extension PopularMoviesUseCase {
    func mapResponseToMovies(_ response: MoviesNetwork.Response) -> [Movie] {
        response.results.compactMap {
            .init(title: $0.title,
                  overview: $0.overview,
                  releaseYear: Int($0.releaseDate.components(separatedBy: "-").first ?? "0")!)
        }
    }
    
    func groupMoviesByYear(_ movies: [Movie]) -> [Int: [Movie]] {
        var yearsToMovies: [Int: [Movie]] = [:]
        for movie in movies {
            if let _ = yearsToMovies[movie.releaseYear] {
                yearsToMovies[movie.releaseYear]?.append(movie)
            } else {
                yearsToMovies[movie.releaseYear] = [movie]
            }
        }
        return yearsToMovies
    }
}
