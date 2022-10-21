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
    
    func fetchMovies(page: Int, completion: @escaping (Result<(totalPages: Int, movies: [Movie]), Error>) -> ()) {
        networkService.fetchPopularMovies(page: page) { result in
            var response: Result<(totalPages: Int, movies: [Movie]), Error>!
            defer { completion(response) }
            switch result {
                case .success(let moviesResponse):
                    let movies = mapResponseToMovies(moviesResponse)
                    response = .success((moviesResponse.totalPages, movies))
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
                  releaseYear: $0.releaseDate.components(separatedBy: "-").first ?? "0",
                  imagePath: $0.posterPath)
        }
    }
}
