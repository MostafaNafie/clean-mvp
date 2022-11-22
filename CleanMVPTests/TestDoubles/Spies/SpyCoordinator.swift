//
//  SpyCoordinator.swift
//  TheMovieDBTests
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import Foundation
@testable import CleanMVP

class SpyCoordinator: MovieListCoordinating {
    var navigateToMovieDetailsCount = 0
    var navigateToMovieDetailsID = 0
    
    func navigateToMovieDetails(with id: Int) {
        navigateToMovieDetailsID =  id
        navigateToMovieDetailsCount += 1
    }
}
