//
//  MoviesSearchRequest.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

struct MoviesSearchRequest: NetworkingRequest {
    var path: String { NetworkingConstants.searchMovies }
    var headers: [String: String] = [:]
    var queryItems: [URLQueryItem]?
}
