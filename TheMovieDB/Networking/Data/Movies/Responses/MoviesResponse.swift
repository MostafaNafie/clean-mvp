//
//  MoviesResponse.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

enum MoviesNetwork {
    struct Response: Decodable {
        let page: Int
        let results: [Movie]
        let totalPages, totalResults: Int

        enum CodingKeys: String, CodingKey {
            case page, results
            case totalPages = "total_pages"
            case totalResults = "total_results"
        }
    }
    
    struct Movie: Decodable {
        let adult: Bool
        let backdropPath: String?
        let genreIDS: [Int]?
        let id: Int
        let originalLanguage: String
        let originalTitle, overview: String
        let popularity: Double
        let posterPath: String?
        let releaseDate: String?
        let title: String
        let video: Bool
        let voteAverage: Double
        let voteCount: Int
        let tagline: String?
        let status: String?
        let revenue: Int?

        enum CodingKeys: String, CodingKey {
            case adult
            case backdropPath = "backdrop_path"
            case genreIDS = "genre_ids"
            case id
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case overview, popularity
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case title, video
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
            case tagline
            case status
            case revenue
        }
    }
}
