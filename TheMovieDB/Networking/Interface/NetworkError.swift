//
//  NetworkError.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

enum NetworkError: Error {
    case noData
    case networkError
    case invalidAPIKey
}
