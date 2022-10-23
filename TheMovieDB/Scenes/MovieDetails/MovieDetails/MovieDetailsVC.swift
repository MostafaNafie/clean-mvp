//
//  MovieDetailsVC.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit
import Kingfisher

protocol MovieDetailsView: BaseView {
    func show(_ movieDetails: MovieDetails)
}

final class MovieDetailsVC: BaseVC<MovieDetailsView, MovieDetailsPresenter> {
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overViewLabel: UILabel!
    
    // MARK: - View Lifecycle
    override func setupUI() {
        posterImageView.layer.cornerRadius = 20
    }
}

// MARK: - View Protocol
extension MovieDetailsVC: MovieDetailsView {
    func show(_ movieDetails: MovieDetails) {
        titleLabel.text = movieDetails.title
        subtitleLabel.text = movieDetails.subtitle
        taglineLabel.text = movieDetails.tagline
        overViewLabel.text = movieDetails.overview
        posterImageView.kf.setImage(with: movieDetails.posterURL,
                                    placeholder: UIImage(named: "poster-placeholder"),
                                    options: [.transition(.fade(0.3))])
    }
}
