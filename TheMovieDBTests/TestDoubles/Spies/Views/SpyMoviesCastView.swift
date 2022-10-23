//
//  SpyMoviesCastView.swift
//  TheMovieDBTests
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import Foundation
@testable import TheMovieDB

final class SpyMoviesCastView: MoviesCastView {
    var showCastCount = 0
    
    func showCast() {
        showCastCount += 1
    }
}

extension SpyMoviesCastView {
    func startLoading() {}
    
    func stopLoading() {}
    
    func showError(with title: String, and message: String) {}
}
