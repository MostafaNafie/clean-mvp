//
//  MoviesCastVC.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import UIKit

protocol MoviesCastView: AnyObject {
    func startLoading()
    func stopLoading()
    func showError(with title: String, and message: String)
}

class MoviesCastVC: UIViewController {
    // MARK: - Properties
    private let presenter: MoviesCastPresenter
    
    // MARK: - Init
    init(presenter: MoviesCastPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - View Protocol
extension MoviesCastVC: MoviesCastView {
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

// MARK: - CastVCDelegate
extension MoviesCastVC: CastVCDelegate {
    func getCast(for moviesIDs: [Int]) {
        presenter.getCast(for: moviesIDs)
    }
}

// MARK: - Private Helpers
private extension MoviesCastVC {
    func setupUI() {
        showLoader()
    }
}
