//
//  NetworkingConstants.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

enum NetworkingConstants {
    static let baseURL = "https://api.themoviedb.org/3"
    static let imagesBaseURL = "https://image.tmdb.org/t/p/original"
    static let apiKey = "360fea79b52f0de605753ec67513d039"
    static let popularMovies = "/movie/popular"
    static let searchMovies = "/search/movie"
    static let movieDetails = "/movie"
    static let similarMovies = "/movie/{movie_id}/similar"
    static let movieCast = "/movie/{movie_id}/credits"
}
