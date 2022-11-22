//
//  MovieDetails.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

struct MovieDetails: Equatable {
    let title: String
    let subtitle: String
    let overview: String
    let posterURL: URL
    let tagline: String
    var isAddedToWatchlist: Bool
}
