//
//  MovieResponseMapper.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

final class MovieResponseMapper {
    func mapResponseToMovieDetails(_ response: MoviesNetwork.Movie) -> MovieDetails {
        let releaseDate = response.releaseDate ?? "N/A"
        let status = response.status ?? "N/A"
        let revenue = format(response.revenue ?? 0) ?? "N/A"
        let subtitle = releaseDate + " • " + status + " • " + revenue
        
        return .init(title: response.title,
                     subtitle: subtitle,
                     overview: response.overview,
                     posterURL: URL(string: NetworkingConstants.imagesBaseURL + (response.posterPath ?? ""))!,
                     tagline: response.tagline ?? "N/A",
                     isAddedToWatchlist: false)
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
