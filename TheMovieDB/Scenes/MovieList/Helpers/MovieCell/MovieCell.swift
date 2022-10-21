//
//  MovieCell.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit

class MovieCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    
    // MARK: - Public Methods
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
    }
}
