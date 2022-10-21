//
//  MovieListTableViewDelegate.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit

final class MovieListTableViewDelegate: NSObject {
    // MARK: - Properties
    private let presenter: MovieListPresenter
    
    init(presenter: MovieListPresenter) {
        self.presenter = presenter
    }
}

extension MovieListTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter.reachedMovie(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectMovie()
    }
}
