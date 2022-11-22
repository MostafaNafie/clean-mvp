//
//  FakeWatchlistDataStore.swift
//  TheMovieDBTests
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import Foundation
@testable import CleanMVP

struct FakeWatchlistDataStore: WatchlistDataStoring {
    func addMovie(with id: Int) {
    }
    
    func removeMovie(with id: Int) {
    }
    
    func containsMovie(with id: Int) -> Bool {
        false
    }
}
