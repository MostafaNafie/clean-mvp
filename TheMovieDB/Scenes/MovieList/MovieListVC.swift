//
//  MovieListVC.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import UIKit

protocol MovieListView: AnyObject {
    func showMovies()
    func startLoading()
    func stopLoading()
    func showError(with title: String, and message: String)
}

final class MovieListVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    private let presenter: MovieListPresenter
    private lazy var tableViewDataSource = MovieListTableViewDataSource(presenter: presenter)
    private lazy var tableViewDelegate = MovieListTableViewDelegate(presenter: presenter)
    private lazy var searchBarDelegate = MovieListSearchBarDelegate(presenter: presenter)
    
    // MARK: - Init
    init(presenter: MovieListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.fetchMovies()
    }
}

// MARK: - View Protocol
extension MovieListVC: MovieListView {
    func showMovies() {
        tableView.reloadData()
    }
    
    func startLoading() {
        showLoader()
    }
    
    func stopLoading() {
        hideLoader()
    }
    
    func showError(with title: String, and message: String) {
        showAlert(with: title, and: message)
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
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
    }
    
    func setupSearchBar() {
        searchBar.delegate = searchBarDelegate
        searchBar.placeholder = "Search Movies by Name"
    }
}
