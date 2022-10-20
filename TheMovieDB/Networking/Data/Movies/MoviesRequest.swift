//
//  MoviesRequest.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

struct MoviesRequest: NetworkingRequest {
    var path: String { NetworkingConstants.popularMovies }
    var headers: [String: String] = [:]
    var queryItems: [URLQueryItem]?
}
