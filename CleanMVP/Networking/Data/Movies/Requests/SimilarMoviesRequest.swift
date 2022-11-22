//
//  SimilarMoviesRequest.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 22/10/2022.
//

import Foundation

struct SimilarMoviesRequest: NetworkingRequest {
    var id: Int
    var path: String { NetworkingConstants.similarMovies.replacingOccurrences(of: "{movie_id}", with:"\(id)") }
    var headers: [String: String] = [:]
    var queryItems: [URLQueryItem]?
}
