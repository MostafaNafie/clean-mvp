//
//  TheMovieDBTests.swift
//  TheMovieDBTests
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import XCTest
@testable import TheMovieDB

class MovieListPresenterTests: XCTestCase {
    private let popularMoviesUseCase = PopularMoviesUseCase(networkService: MockPopularMoviesService())
    private var spyMovieListView: SpyMovieListView!
    private var sut: MovieListPresenter!
    
    override func setUp() {
        spyMovieListView = SpyMovieListView()
        sut = MovieListPresenter(popularMoviesUseCase: popularMoviesUseCase)
        sut.view = spyMovieListView
    }

    override func tearDown() {
        sut = nil
    }

    func test_shows_fetched_movies() {
        sut.fetchMovies()
        
        XCTAssertEqual(spyMovieListView.showMoviesCount, 1)
    }
    
    func test_returns_correct_fetched_movies_count() {
        sut.fetchMovies()
        
        XCTAssertEqual(spyMovieListView.movies.count, 20)
    }
    
    func test_returns_correct_fetched_movies_mapping() {
        sut.fetchMovies()
        
        XCTAssertEqual(spyMovieListView.movies[0].title, "Halloween Ends")
    }
}
