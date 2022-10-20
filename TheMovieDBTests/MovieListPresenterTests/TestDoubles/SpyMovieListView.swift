//
//  SpyMovieListView.swift
//  TheMovieDBTests
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation
@testable import TheMovieDB

final class SpyMovieListView: MovieListView {
    var showMoviesCount = 0
    var movies: [Movie] = []
    
    func showMovies(_ movies: [Movie]) {
        self.movies = movies
        showMoviesCount += 1
    }
}
