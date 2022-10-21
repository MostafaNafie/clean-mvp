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
    
    // MARK: - Properties
    private let presenter: MovieListPresenter!
    private let dataSource: MovieListDataSource!
    private let delegate: MovieListDelegate!
    
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
        presenter.fetchMovies()
        setupUI()
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
    func setupUI() {
        title = "Movie List"
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
}
