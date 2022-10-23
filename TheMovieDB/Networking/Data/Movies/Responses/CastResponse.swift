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
        let crew: [Cast]
    }

    // MARK: - Cast
    struct Cast: Codable {
        let adult: Bool
        let gender, id: Int
        let name, originalName: String
        let popularity: Double
        let profilePath: String?
        let castID: Int?
        let character: String?
        let creditID: String
        let order: Int?
        let department: Department
        let job: String?

        enum CodingKeys: String, CodingKey {
            case adult, gender, id
            case department = "known_for_department"
            case name
            case originalName = "original_name"
            case popularity
            case profilePath = "profile_path"
            case castID = "cast_id"
            case character
            case creditID = "credit_id"
            case order, job
        }
    }

    enum Department: String, Codable {
        case acting = "Acting"
        case art = "Art"
        case camera = "Camera"
        case costumeMakeUp = "Costume & Make-Up"
        case crew = "Crew"
        case directing = "Directing"
        case editing = "Editing"
        case lighting = "Lighting"
        case production = "Production"
        case sound = "Sound"
        case visualEffects = "Visual Effects"
        case writing = "Writing"
    }
}
