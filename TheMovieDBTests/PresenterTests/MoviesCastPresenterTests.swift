//
//  MoviesCastPresenterTests.swift
//  TheMovieDBTests
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import XCTest
@testable import TheMovieDB

class MoviesCastPresenterTests: XCTestCase {
    // MARK: - Private Methods
    private let movieCastUseCase = MovieCastUseCase(networkService: MockMovieCastService(), movieCastResponseMapper: MovieCastResponseMapper())
    private let spyMoviesCastView = SpyMoviesCastView()
    private var sut: MoviesCastPresenter!
    
    // MARK: - Tests Lifecycle
    override func setUp() {
        sut = MoviesCastPresenter(movieCastUseCase: movieCastUseCase)
        sut.view = spyMoviesCastView
    }
    
    override func tearDown() {
        sut = nil
    }
    
    // MARK: - Test
    func test_shows_correct_cast() {
        // WHEN
        let expectation = XCTestExpectation(description: #function)
        sut.fetchCast(for: [0]) {
            expectation.fulfill()
        }
        // THEN
        wait(for: [expectation], timeout: 3.0)
        XCTAssertEqual(spyMoviesCastView.showCastCount, 1)
        XCTAssertEqual(sut.actorsCount(), 1)
        XCTAssertEqual(sut.directorsCount(), 2)
    }
    
    func test_correct_cast_mapping() {
        // WHEN
        let expectation = XCTestExpectation(description: #function)
        sut.fetchCast(for: [0]) {
            expectation.fulfill()
        }
        // THEN
        wait(for: [expectation], timeout: 3.0)
        let expectedActor = Cast(department: "Acting", popularity: 93.792, profileImageURL: URL(string: "https://image.tmdb.org/t/p/original/wIflU6AJSz4pAuTAp3ra4vLwJ2i.jpg")!)
        XCTAssertEqual(sut.actor(at: 0), expectedActor)
        let expectedDirector = Cast(department: "Directing", popularity: 1.11, profileImageURL: URL(string: "https://image.tmdb.org/t/p/original")!)
        XCTAssertEqual(sut.director(at: 0), expectedDirector)
    }
}
