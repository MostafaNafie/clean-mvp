//
//  CastResponse.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import Foundation

enum CastNetwork {
    struct Response: Decodable {
        let id: Int
        let cast: [Cast]
    }

    // MARK: - Cast
    struct Cast: Decodable {
        let adult: Bool
        let gender, id: Int
        let knownForDepartment: KnownForDepartment
        let name, originalName: String
        let popularity: Double
        let profilePath: String?
        let castID: Int
        let character, creditID: String
        let order: Int

        enum CodingKeys: String, CodingKey {
            case adult, gender, id
            case knownForDepartment = "known_for_department"
            case name
            case originalName = "original_name"
            case popularity
            case profilePath = "profile_path"
            case castID = "cast_id"
            case character
            case creditID = "credit_id"
            case order
        }
    }

    enum KnownForDepartment: String, Decodable {
        case acting = "Acting"
        case directing = "Directing"
        case crew = "Crew"
        case writing = "Writing"
    }
}
