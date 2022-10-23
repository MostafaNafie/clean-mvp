//
//  WatchlistDataStore.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import Foundation

class WatchlistDataStore {
    private let key = "MDBWatchlist"
    private var watchlist: Set<Int> = []
    
    init() {
        let array: [Int] = UserDefaults.standard.array(forKey: key) as? [Int] ?? []
        watchlist = Set(array)
    }
    
    func addMovie(with id: Int) {
        watchlist.insert(id)
        let array = Array(watchlist)
        UserDefaults.standard.set(array, forKey: key)
    }
    
    func removeMovie(with id: Int) {
        watchlist.remove(id)
        let array = Array(watchlist)
        UserDefaults.standard.set(array, forKey: key)
    }
    
    func containsMovie(with id: Int) -> Bool {
        watchlist.contains(id)
    }
}
