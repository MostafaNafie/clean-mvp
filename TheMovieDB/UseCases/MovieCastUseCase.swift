//
//  MovieCastUseCase.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import Foundation

class MovieCastUseCase {
    // MARK: - Properties
    private let networkService: MovieCastServicing
    private let movieCastResponseMapper: MovieCastResponseMapper
    private let serialQueue = DispatchQueue(label: "SerialQueue")
    private var allActors = [Cast]()
    private var allDirectors = [Cast]()
    private var error: Error?
    
    // MARK: - Init
    init(networkService: MovieCastServicing, movieCastResponseMapper: MovieCastResponseMapper) {
        self.networkService = networkService
        self.movieCastResponseMapper = movieCastResponseMapper
    }
    
    // MARK: - Public Methods
    func fetchMoviesCast(for moviesIDs: [Int], completion: @escaping (Result<(actors: [Cast], directors: [Cast]), Error>) -> ()) {
        let group = DispatchGroup()
        
        for movieID in moviesIDs {
            group.enter()
            DispatchQueue.global().async() { [weak self] in
                self?.fetchMovieCast(by: movieID) {
                    group.leave()
                }
            }
        }
        
        group.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            
            var response: Result<(actors: [Cast], directors: [Cast]), Error>!
            defer { completion(response) }
            
            guard self.error == nil else {
                response = .failure(self.error!)
                return
            }
            
            let sortedActors = self.allActors
                .sorted(by: { $0.popularity > $1.popularity })
                .prefix(5)
            let sortedDirectors = self.allDirectors
                .sorted(by: { $0.popularity > $1.popularity })
                .prefix(5)
            response = .success((Array(sortedActors), Array(sortedDirectors)))
        }
    }
}

// MARK: - Private Helpers
private extension MovieCastUseCase {
    func fetchMovieCast(by id: Int, completion: @escaping () -> ()) {
        networkService.fetchMovieCast(by: id) { [weak self] result in
            guard let self = self else { return }
            defer { completion() }
            switch result {
                case .success(let castResponse):
                    let mappedResponse = self.movieCastResponseMapper.mapResponseToActorsAndDirectors(castResponse)
                    self.serialQueue.sync {
                        self.allActors.append(contentsOf: mappedResponse.actors)
                        self.allDirectors.append(contentsOf: mappedResponse.directors)
                    }
                case .failure(let error):
                    self.error = error
            }
        }
    }
}
