//
//  Cast.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import Foundation

struct Cast: Equatable, Hashable {
    let name: String
    let department: String
    let popularity: Double
    let profileImageURL: URL
}
