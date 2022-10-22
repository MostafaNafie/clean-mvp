//
//  MovieDetailsVC.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit

protocol MovieDetailsView: AnyObject {
    func show(_ movieDetails: MovieDetails)
    func startLoading()
    func stopLoading()
}

final class MovieDetailsVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
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
    }
}

// MARK: - View Protocol
extension MovieDetailsVC: MovieDetailsView {
    func show(_ movieDetails: MovieDetails) {
        titleLabel.text = movieDetails.title
        overViewLabel.text = movieDetails.overview
        releaseDateLabel.text = movieDetails.releaseDate
    }
    
    func startLoading() {
        showLoader()
    }
    
    func stopLoading() {
        hideLoader()
    }
}

// MARK: - Private helpers
private extension MovieDetailsVC {
}
