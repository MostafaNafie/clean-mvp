//
//  MovieCastResponseMapper.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import Foundation

struct MovieCastResponseMapper {
    func mapResponseToActorsAndDirectors(_ response: CastNetwork.Response) -> (actors: [Cast], directors: [Cast]) {
        let cast = response.crew.map { cast in
            Cast(name: cast.name,
                 department: cast.department.rawValue,
                 popularity: cast.popularity,
                 profileImageURL: URL(string: NetworkingConstants.imagesBaseURL + (cast.profilePath ?? ""))!)
        }
        
        var actors = [Cast]()
        var directors = [Cast]()
        
        cast.forEach { cast in
            switch cast.department {
                case "Acting":
                    actors.append(cast)
                case "Directing":
                    directors.append(cast)
                default:
                    break
            }
        }
        
        return (actors, directors)
    }
}
