//
//  MovieCastRequest.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import Foundation

struct MovieCastRequest: NetworkingRequest {
    var id: Int
    var path: String { NetworkingConstants.movieCast.replacingOccurrences(of: "{movie_id}", with:"\(id)") }
    var headers: [String: String] = [:]
    var queryItems: [URLQueryItem]?
}
