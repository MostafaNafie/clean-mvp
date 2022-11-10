//
//  MovieDetailsVC.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit

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
    @IBOutlet weak var addToWatchlistButton: UIButton!
    
    // MARK: - View Lifecycle
    override func setupUI() {
        posterImageView.layer.cornerRadius = 20
        addToWatchlistButton.setImage(UIImage(named: Resources.Images.heartFilled), for: .selected)
        addToWatchlistButton.setImage(UIImage(named: Resources.Images.heartEmpty), for: .normal)
    }
    
    // MARK: - Actions
    @IBAction private func watchlistButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        presenter.watchlistButtonTapped()
    }
}

// MARK: - View Protocol
extension MovieDetailsVC: MovieDetailsView {
    func show(_ movieDetails: MovieDetails) {
        titleLabel.text = movieDetails.title
        subtitleLabel.text = movieDetails.subtitle
        taglineLabel.text = movieDetails.tagline
        overViewLabel.text = movieDetails.overview
        posterImageView.setImage(with: movieDetails.posterURL)
        addToWatchlistButton.isSelected = movieDetails.isAddedToWatchlist
    }
}
