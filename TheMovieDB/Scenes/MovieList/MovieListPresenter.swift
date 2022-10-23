//
//  MovieListPresenter.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

final class MovieListPresenter: BasePresenter<MovieListView> {
    enum MovieListPresenterState {
        case popularMovies
        case searchMovies
    }
    
    // MARK: - Poperties
    weak var view: MovieListView!
    
    // MARK: - Private Properties
    private let popularMoviesUseCase: PopularMoviesUseCase
    private let searchMoviesUseCase: SearchMoviesUseCase
    private let coordinator: MovieListCoordinating
    private var currentState: MovieListPresenterState = .popularMovies
    private var movies: [Movie] =  []
    private var currentPage = 1
    private var totalPages = 1
    private var query = ""
    
    // MARK: - Init
    init(popularMoviesUseCase: PopularMoviesUseCase,
         searchMoviesUseCase: SearchMoviesUseCase,
         coordinator: MovieListCoordinating) {
        self.popularMoviesUseCase = popularMoviesUseCase
        self.searchMoviesUseCase = searchMoviesUseCase
        self.coordinator = coordinator
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        fetchMovies()
    }
    
    // MARK: - Public Methods
    func moviesCount() -> Int {
        movies.count
    }
    
    func movie(at row: Int) -> Movie {
        movies[row]
    }
    
    /// Check if the last movie is about to be displayed to handle pagination
    /// - Parameter indexPath: The indexPath of the cell that is about to be displayed
    func reachedMovie(at row: Int) {
        // check that this is the last item
        let lastFetchedRow = moviesCount() - 1
        guard lastFetchedRow == row else { return }
        // check that currentPage is less that the totalPages
        guard currentPage < totalPages else { return }
        currentPage += 1
        
        switch currentState {
            case .popularMovies:
                fetchMovies(at: currentPage)
            case .searchMovies:
                search(with: query, at: currentPage)
        }
    }
    
    func search(with query: String, at page: Int = 1) {
        guard !query.isEmpty else {
            switchToPopularMoviesState()
            return
        }
        
        if currentState == .popularMovies || query != self.query {
            switchToSearchMoviesState(query)
        }
        
        view.startLoading()
        searchMoviesUseCase.fetchMovies(by: query, at: page) { [weak self] result in
            self?.handleMoviesResult(result)
        }
    }
    
    func didSelectMovie(at row: Int) {
        let id = movies[row].id
        coordinator.navigateToMovieDetails(with: id)
    }
}

// MARK: - Private Helpers
private extension MovieListPresenter {
    func fetchMovies(at page: Int = 1) {
        view.startLoading()
        popularMoviesUseCase.fetchMovies(at: page) { [weak self] result in
            self?.handleMoviesResult(result)
        }
    }
    
    func handleMoviesResult(_ result: Result<(totalPages: Int, movies: [Movie]), Error>) {
        switch result {
            case .success(let response):
                totalPages = response.totalPages
                movies += response.movies
                view.showMovies()
            case .failure(let error):
                view.showError(with: "\(type(of: error))", and: error.localizedDescription)
        }
        view.stopLoading()
    }
    
    func switchToPopularMoviesState() {
        query = ""
        resetMovies()
        fetchMovies()
        currentState = .popularMovies
    }
    
    func switchToSearchMoviesState(_ query: String) {
        self.query = query
        resetMovies()
        currentState = .searchMovies
    }
    
    func resetMovies() {
        currentPage = 1
        movies = []
        view.showMovies()
    }
}
