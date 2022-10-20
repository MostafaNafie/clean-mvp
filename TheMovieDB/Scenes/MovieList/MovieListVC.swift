//
//  MovieListVC.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import UIKit

protocol MovieListView: AnyObject {
    func showMovies(_ movies: [Movie])
}

final class MovieListVC: UIViewController {
    private let presenter: MovieListPresenter!
    
    init(presenter: MovieListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchMovies()
    }
}

extension MovieListVC: MovieListView {
    func showMovies(_ movies: [Movie]) {
        print(#function, movies)
    }
}
