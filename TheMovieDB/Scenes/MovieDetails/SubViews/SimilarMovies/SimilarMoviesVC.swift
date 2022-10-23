//
//  SimilarMoviesVC.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit

protocol SimilarMoviesView: BaseView {
    func showMovies()
    func fetchCast(for moviesIDs: [Int])
}

protocol CastVCDelegate: AnyObject {
    func fetchCast(for moviesIDs: [Int])
}

final class SimilarMoviesVC: BaseVC<SimilarMoviesView, SimilarMoviesPresenter> {
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private lazy var collectionViewDataSource = SimilarMoviesCollectionViewDataSource(presenter: presenter)
    private lazy var collectionViewDelegate = SimilarMoviesCollectionViewDelegateFlowLayout(presenter: presenter)
    
    // MARK: - Properties
    weak var castVCDelegate: CastVCDelegate!
    
    // MARK: - View Lifecycle
    override func setupUI() {
        titleLabel.text = "Similar Movies"
        setupCollectionView()
    }
}

// MARK: - View Protocol
extension SimilarMoviesVC: SimilarMoviesView {
    func showMovies() {
        collectionView.reloadData()
    }
    
    func fetchCast(for moviesIDs: [Int]) {
        castVCDelegate.fetchCast(for: moviesIDs)
    }
}

// MARK: - Private helpers
private extension SimilarMoviesVC {
    func setupCollectionView() {
        collectionView.register(cellType: SimilarMovieCell.self)
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
        if let flow = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flow.scrollDirection = .horizontal
        }
    }
}
