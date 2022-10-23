//
//  MovieDetailsVC.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit
import Kingfisher

protocol MovieDetailsView: AnyObject {
    func show(_ movieDetails: MovieDetails)
    func startLoading()
    func stopLoading()
    func showError(with title: String, and message: String)
}

final class MovieDetailsVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overViewLabel: UILabel!
    
    // MARK: - Properties
    private let presenter: MovieDetailsPresenter
    
    // MARK: - Init
    init(presenter: MovieDetailsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchMoviesDetails()
        setupUI()
    }
}

// MARK: - View Protocol
extension MovieDetailsVC: MovieDetailsView {
    func show(_ movieDetails: MovieDetails) {
        titleLabel.text = movieDetails.title
        subtitleLabel.text = movieDetails.releaseDate + " • " + movieDetails.status + " • " + movieDetails.revenue
        taglineLabel.text = movieDetails.tagline
        overViewLabel.text = movieDetails.overview
        posterImageView.kf.setImage(with: movieDetails.posterURL,
                                    placeholder: UIImage(named: "poster-placeholder"),
                                    options: [.transition(.fade(0.3))])
    }
    
    func startLoading() {
        showLoader()
    }
    
    func stopLoading() {
        hideLoader()
    }
    
    func showError(with title: String, and message: String) {
        showAlert(with: title, and: message)
    }
}

// MARK: - Private Helpers
private extension MovieDetailsVC {
    func setupUI() {
        posterImageView.layer.cornerRadius = 20
    }
}
