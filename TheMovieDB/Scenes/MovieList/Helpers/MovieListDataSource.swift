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
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter.yearsCount()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        presenter.year(at: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.popularMoviesCount(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter.popularMovie(at: indexPath.section, and: indexPath.row).title
        return cell
    }
}
