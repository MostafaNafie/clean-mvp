//
//  MovieListVC.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import UIKit

protocol MovieListView: BaseView {
    func showMovies()
}

final class MovieListVC: BaseVC<MovieListView, MovieListPresenter> {
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    private lazy var tableViewDataSource = MovieListTableViewDataSource(presenter: presenter)
    private lazy var tableViewDelegate = MovieListTableViewDelegate(presenter: presenter)
    private lazy var searchBarDelegate = MovieListSearchBarDelegate(presenter: presenter)
    
    // MARK: - View Lifecycle
    override func setupUI() {
        title = "Movie List"
        setupSearchBar()
        setupTableView()
    }
}

// MARK: - View Protocol
extension MovieListVC: MovieListView {
    func showMovies() {
        tableView.reloadData()
    }
}

// MARK: - Private helpers
private extension MovieListVC {
    func setupTableView() {
        tableView.register(cellType: MovieCell.self)
        tableView.keyboardDismissMode = .onDrag
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
    }
    
    func setupSearchBar() {
        searchBar.delegate = searchBarDelegate
        searchBar.placeholder = "Search Movies by Name"
    }
}
