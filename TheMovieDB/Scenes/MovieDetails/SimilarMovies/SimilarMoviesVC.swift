//
//  SimilarMoviesVC.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit

protocol SimilarMoviesView: AnyObject {
    func startLoading()
    func stopLoading()
    func showError(with title: String, and message: String)
}

final class SimilarMoviesVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    // MARK: - Properties
    private let presenter: SimilarMoviesPresenter
    
    // MARK: - Init
    init(presenter: SimilarMoviesPresenter) {
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
extension SimilarMoviesVC: SimilarMoviesView {
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

// MARK: - Private helpers
private extension SimilarMoviesVC {
}
