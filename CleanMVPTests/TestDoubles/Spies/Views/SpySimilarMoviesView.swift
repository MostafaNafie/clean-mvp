//
//  SpySimilarMoviesView.swift
//  TheMovieDBTests
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import Foundation
@testable import CleanMVP

final class SpySimilarMoviesView: SimilarMoviesView {
    var showMoviesCount = 0
    var fetchCastCount = 0
    var moviesIDs = [Int]()
    
    func showMovies() {
        showMoviesCount += 1
    }
    
    func fetchCast(for moviesIDs: [Int]) {
        fetchCastCount += 1
        self.moviesIDs = moviesIDs
    }
    
}

extension SpySimilarMoviesView {
    func startLoading() {}
    
    func stopLoading() {}
    
    func showError(with title: String, and message: String) {}
}
