//
//  SpyMovieDetailsView.swift
//  TheMovieDBTests
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import Foundation

import Foundation
@testable import TheMovieDB

final class SpyMovieDetailsView: MovieDetailsView {
    var showMovieDetailsCount = 0
    var movieDetails: MovieDetails?
    
    func show(_ movieDetails: MovieDetails) {
        showMovieDetailsCount += 1
        self.movieDetails = movieDetails
    }
}

extension SpyMovieDetailsView {
    func startLoading() {}
    
    func stopLoading() {}
    
    func showError(with title: String, and message: String) {}
}
