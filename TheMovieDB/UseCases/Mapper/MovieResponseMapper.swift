//
//  MovieResponseMapper.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

struct MovieResponseMapper {
    func mapResponseToMovieDetails(_ response: MoviesNetwork.Movie) -> MovieDetails {
        .init(title: response.title,
              overview: response.overview,
              releaseDate: response.releaseDate ?? "N/A",
              posterURL: URL(string: NetworkingConstants.imagesBaseURL + (response.posterPath ?? ""))!)
    }
}
