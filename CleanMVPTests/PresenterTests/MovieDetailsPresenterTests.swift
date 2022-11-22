//
//  MovieDetailsPresenterTests.swift
//  TheMovieDBTests
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import XCTest
@testable import CleanMVP

class MovieDetailsPresenterTests: XCTestCase {
    // MARK: - Private Methods
    private let movieDetailsUseCase = MovieDetailsUseCase(networkService: MockMovieDetailsService(), movieResponseMapper: MovieResponseMapper())
    private let spyMovieDetailsView = SpyMovieDetailsView()
    private var sut: MovieDetailsPresenter!
    
    // MARK: - Tests Lifecycle
    override func setUp() {
        sut = MovieDetailsPresenter(id: 0,
                                    movieDetailsUseCase: movieDetailsUseCase,
                                    watchlistUseCase: WatchlistUseCase(dataStore: FakeWatchlistDataStore()))
        sut.view = spyMovieDetailsView
    }
    
    override func tearDown() {
        sut = nil
    }
    
    // MARK: - Tests
    func test_shows_fetched_movie() {
        // WHEN
        sut.viewDidLoad()
        
        // THEN
        let expectedMovieDetails = MovieDetails(
            title: "Black Adam",
            subtitle: "2022-10-19 • Released • $50,000,000",
            overview: "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
            posterURL: URL(string: "https://image.tmdb.org/t/p/original/3zXceNTtyj5FLjwQXuPvLYK5YYL.jpg")!,
            tagline: "The world needed a hero. It got Black Adam.",
            isAddedToWatchlist: false
        )
        XCTAssertEqual(spyMovieDetailsView.movieDetails!, expectedMovieDetails)
        XCTAssertEqual(spyMovieDetailsView.showMovieDetailsCount, 1)
    }
    
    func test_returns_correct_fetched_movies_count() {
        // WHEN
        sut.viewDidLoad()
        
        // THEN
        let expectedMovieDetails = MovieDetails(
            title: "Black Adam",
            subtitle: "2022-10-19 • Released • $50,000,000",
            overview: "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
            posterURL: URL(string: "https://image.tmdb.org/t/p/original/3zXceNTtyj5FLjwQXuPvLYK5YYL.jpg")!,
            tagline: "The world needed a hero. It got Black Adam.",
            isAddedToWatchlist: false
        )
        XCTAssertEqual(spyMovieDetailsView.movieDetails!, expectedMovieDetails)
    }
}
