//
//  Movie.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

struct Movie {
    let id: Int
    let title: String
    let overview: String
    let releaseYear: String
    let posterURL: URL
    var isAddedToWatchList: Bool
}
