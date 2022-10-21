//
//  MovieListVC.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import UIKit

protocol MovieListView: AnyObject {
    func showMovies()
}

final class MovieListVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    private let presenter: MovieListPresenter!
    private let dataSource: MovieListDataSource!
    private let delegate: MovieListDelegate!
    private let debouncer = Debouncer(delay: 0.3)
    
    init(presenter: MovieListPresenter, dataSource: MovieListDataSource, delegate: MovieListDelegate) {
        self.presenter = presenter
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.fetchPopularMovies()
    }
}

// MARK: - View Protocol
extension MovieListVC: MovieListView {
    func showMovies() {
        tableView.reloadData()
    }
}

// MARK: - View Protocol
extension MovieListVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.search(with: searchBar.text ?? "")
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        debouncer.run { [weak self] in
            self?.presenter.search(with: searchBar.text ?? "")
            if searchText.isEmpty {
                searchBar.resignFirstResponder()
            }
        }
        
    }
}

// MARK: - Private helpers
private extension MovieListVC {
    func setupUI() {
        title = "Movie List"
        setupSearchBar()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(cellType: MovieCell.self)
        tableView.keyboardDismissMode = .onDrag
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Search Movies by Name"
    }
}

