//
//  MovieDetailsRequest.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

struct MovieDetailsRequest: NetworkingRequest {
    var id: Int
    var path: String { NetworkingConstants.movieDetails + "/\(id)" }
    var headers: [String: String] = [:]
    var queryItems: [URLQueryItem]?
}
