//
//  MovieListTableViewDataSource.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit

final class MovieListTableViewDataSource: NSObject {
    // MARK: - Properties
    private let presenter: MovieListPresenter
    
    init(presenter: MovieListPresenter) {
        self.presenter = presenter
    }
}

extension MovieListTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.moviesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieCell = tableView.dequeueReusableCell(for: indexPath)
        let movie = presenter.movie(at: indexPath.row)
        cell.configure(with: movie)
        return cell
    }
}
