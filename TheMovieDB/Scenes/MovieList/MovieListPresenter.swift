//
//  MovieListPresenter.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

class MovieListPresenter {
    weak var view: MovieListView!
    
    func fetchMovies() {
        view.showMovies()
    }
}

