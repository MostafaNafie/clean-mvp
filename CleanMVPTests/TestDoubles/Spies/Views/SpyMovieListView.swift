//
//  SpyMovieListView.swift
//  TheMovieDBTests
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation
@testable import CleanMVP

final class SpyMovieListView: MovieListView  {
    var showMoviesCount = 0
    
    func showMovies() {
        showMoviesCount += 1
    }
}

extension SpyMovieListView{
    func startLoading() {}
    
    func stopLoading() {}
    
    func showError(with title: String, and message: String) {}
}
