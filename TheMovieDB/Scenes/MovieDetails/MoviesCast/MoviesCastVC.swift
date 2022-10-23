//
//  MoviesCastVC.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import UIKit

protocol MoviesCastView: BaseView {
}

class MoviesCastVC: BaseVC<MoviesCastView, MoviesCastPresenter> {
    // MARK: - View Lifecycle
    override func setupUI() {
        showLoader()
    }
}

// MARK: - View Protocol
extension MoviesCastVC: MoviesCastView {
}

// MARK: - CastVCDelegate
extension MoviesCastVC: CastVCDelegate {
    func getCast(for moviesIDs: [Int]) {
        presenter.getCast(for: moviesIDs)
    }
}
