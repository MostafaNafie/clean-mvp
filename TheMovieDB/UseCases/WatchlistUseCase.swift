//
//  WatchlistUseCase.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 24/10/2022.
//

import Foundation

final class WatchlistUseCase {
    // MARK: - Properties
    private let dataStore: WatchlistDataStoring
    
    // MARK: - Init
    init(dataStore: WatchlistDataStoring) {
        self.dataStore = dataStore
    }
}

extension WatchlistUseCase: WatchlistDataStoring {
    func addMovie(with id: Int) {
        dataStore.addMovie(with: id)
    }
    
    func removeMovie(with id: Int) {
        dataStore.removeMovie(with: id)
    }
    
    func containsMovie(with id: Int) -> Bool {
        dataStore.containsMovie(with: id)
    }
}
