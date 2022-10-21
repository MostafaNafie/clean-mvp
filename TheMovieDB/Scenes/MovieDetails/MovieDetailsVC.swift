//
//  MovieDetailsVC.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit

protocol MovieDetailsView: AnyObject {
    func showMovieDetails()
}

final class MovieDetailsVC: UIViewController {
    
    // MARK: - Properties
    private let presenter: MovieDetailsPresenter
    
    init(presenter: MovieDetailsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        presenter.fetchMoviesDetails()
    }
}

// MARK: - View Protocol
extension MovieDetailsVC: MovieDetailsView {
    func showMovieDetails() {
        print(#function)
    }
}

// MARK: - Private helpers
private extension MovieDetailsVC {
    func setupUI() {
        title = "Movie Details"
    }
}
