//
//  MovieListDataSource.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation
import UIKit

class MovieListDataSource: NSObject {
    // MARK: - Properties
    private let presenter: MovieListPresenter!
    
    init(presenter: MovieListPresenter) {
        self.presenter = presenter
    }
}

extension MovieListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.popularMoviesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter.popularMovie(at: indexPath.row).title
        return cell
    }
}
