//
//  SimilarMoviesPresenterTests.swift
//  TheMovieDBTests
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import XCTest
@testable import CleanMVP

class SimilarMoviesPresenterTests: XCTestCase {
    // MARK: - Private Methods
    private let similarMoviesUseCase = SimilarMoviesUseCase(networkService: MockSimilarMoviesService(), moviesResponseMapper: MoviesResponseMapper())
    private let spySimilarMoviesView = SpySimilarMoviesView()
    private var sut: SimilarMoviesPresenter!
    
    // MARK: - Tests Lifecycle
    override func setUp() {
        sut = SimilarMoviesPresenter(id: 0, similarMoviesUseCase: similarMoviesUseCase)
        sut.view = spySimilarMoviesView
    }
    
    override func tearDown() {
        sut = nil
    }
    
    // MARK: - Test
    func test_shows_fetched_movies() {
        // WHEN
        sut.viewDidLoad()
        
        // THEN
        XCTAssertEqual(spySimilarMoviesView.showMoviesCount, 1)
    }
    
    func test_returns_correct_fetched_movies_count() {
        // WHEN
        sut.viewDidLoad()
        
        // THEN
        XCTAssertEqual(sut.moviesCount(), 5)
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
    
    func test_fetches_cast_is_called_with_correct_IDs() {
        // WHEN
        sut.viewDidLoad()
        
        // THEN
        XCTAssertEqual(spySimilarMoviesView.fetchCastCount, 1)
        XCTAssertEqual(spySimilarMoviesView.moviesIDs, [616820, 760161, 575322, 985939, 718930])
    }
}
