//
//  MovieResponseMapper.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

struct MovieResponseMapper {
    func mapResponseToMovieDetails(_ response: MoviesNetwork.Movie) -> MovieDetails {
        .init(title: response.title,
              overview: response.overview,
              releaseDate: response.releaseDate ?? "N/A",
              posterURL: URL(string: NetworkingConstants.imagesBaseURL + (response.posterPath ?? ""))!,
              tagline: response.tagline ?? "N/A",
              status: response.status ?? "N/A",
              revenue: format(response.revenue ?? 0) ?? "N/A")
    }
}

private extension MovieResponseMapper {
    func format(_ revenue: Int) -> String? {
        guard
            revenue > 0,
            let firstLanguage = Locale.preferredLanguages.first
        else { return nil }
        let localeInfo = [
            NSLocale.Key.currencyCode.rawValue : "USD",
            NSLocale.Key.languageCode.rawValue : firstLanguage
        ]
        let currentLocale = Locale(identifier: Locale.identifier(fromComponents: localeInfo))
        let amountInUnits = NSDecimalNumber(mantissa: UInt64(revenue), exponent: 1, isNegative: false)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = currentLocale
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter.string(from: amountInUnits)
    }
}
