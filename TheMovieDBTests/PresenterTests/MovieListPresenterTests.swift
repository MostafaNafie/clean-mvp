//
//  TheMovieDBTests.swift
//  TheMovieDBTests
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import XCTest
@testable import TheMovieDB

class MovieListPresenterTests: XCTestCase {
    // MARK: - Private Methods
    private let popularMoviesUseCase = PopularMoviesUseCase(networkService: MockPopularMoviesService(), moviesResponseMapper: MoviesResponseMapper())
    private let searchMoviesUseCase = SearchMoviesUseCase(networkService: MockSearchMoviesService(), moviesResponseMapper: MoviesResponseMapper())
    private let spyCoordinator = SpyCoordinator()
    private let spyMovieListView = SpyMovieListView()
    private var sut: MovieListPresenter!
    
    // MARK: - Tests Lifecycle
    override func setUp() {
        sut = MovieListPresenter(popularMoviesUseCase: popularMoviesUseCase,
                                 searchMoviesUseCase: searchMoviesUseCase,
                                 coordinator: spyCoordinator,
                                 watchlistDataStore: FakeWatchlistDataStore())
        sut.view = spyMovieListView
    }

    override func tearDown() {
        sut = nil
    }

    // MARK: - Tests
    func test_shows_fetched_movies() {
        // WHEN
        sut.viewDidLoad()
        
        // THEN
        XCTAssertEqual(spyMovieListView.showMoviesCount, 1)
    }
    
    func test_returns_correct_fetched_movies_count() {
        // WHEN
        sut.viewDidLoad()
        
        // THEN
        XCTAssertEqual(sut.moviesCount(), 20)
    }
    
    func test_returns_correct_fetched_movies_mapping() {
        // WHEN
        sut.viewDidLoad()
        
        // THEN
        let expectedMovie = Movie(
            id: 616820,
            title: "Halloween Ends",
            overview: "Four years after the events of Halloween in 2018, Laurie has decided to liberate herself from fear and rage and embrace life. But when a young man is accused of killing a boy he was babysitting, it ignites a cascade of violence and terror that will force Laurie to finally confront the evil she can’t control, once and for all.",
            releaseYear: "2022",
            posterURL: URL(string: "https://image.tmdb.org/t/p/original/3uDwqxbr0j34rJVJMOW6o8Upw5W.jpg")!,
            isAddedToWatchList: false)
        XCTAssertEqual(sut.movie(at: 0), expectedMovie)
    }
    
    func test_navigate_to_correct_movie_when_movie_is_selected() {
        // GIVEN
        sut.viewDidLoad()
        
        // WHEN
        sut.didSelectMovie(at: 0)
        
        // THEN
        XCTAssertEqual(spyCoordinator.navigateToMovieDetailsCount, 1)
        XCTAssertEqual(spyCoordinator.navigateToMovieDetailsID, 616820)
    }
    
    func test_pagination_when_last_movie_is_reached() {
        // GIVEN
        sut.viewDidLoad()
        
        // WHEN
        sut.reachedMovie(at: 19)
        
        // THEN
        XCTAssertEqual(spyMovieListView.showMoviesCount, 2)
        XCTAssertEqual(sut.moviesCount(), 40)
    }
    
    func test_correct_search_results() {
        // GIVEN
        sut.viewDidLoad()
        
        // WHEN
        sut.search(with: "Halloween")
        
        // THEN
        XCTAssertEqual(spyMovieListView.showMoviesCount, 3)
        XCTAssertEqual(sut.moviesCount(), 1)
    }
    
    func test_return_popular_movies_when_query_is_empty() {
        // GIVEN
        sut.viewDidLoad()
        
        // WHEN
        sut.search(with: "")
        
        // THEN
        XCTAssertEqual(spyMovieListView.showMoviesCount, 3)
        XCTAssertEqual(sut.moviesCount(), 20)
    }
}
