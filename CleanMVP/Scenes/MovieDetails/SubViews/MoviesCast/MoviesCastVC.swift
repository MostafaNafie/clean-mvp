//
//  MoviesCastVC.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import UIKit

protocol MoviesCastView: BaseView {
    func showCast()
}

class MoviesCastVC: BaseVC<MoviesCastView, MoviesCastPresenter> {
    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var actorsLabel: UILabel!
    @IBOutlet private weak var directorsLabel: UILabel!
    @IBOutlet private weak var actorsCollectionView: UICollectionView!
    @IBOutlet private weak var directorsCollectionView: UICollectionView!
    
    // MARK: - Properties
    private lazy var actorsCollectionViewDataSource = ActorsCollectionViewDataSource(presenter: presenter)
    private lazy var actorsCollectionViewDelegate = ActorsCollectionViewDelegateFlowLayout(presenter: presenter)
    private lazy var directorsCollectionViewDataSource = DirectorsCollectionViewDataSource(presenter: presenter)
    private lazy var directorsCollectionViewDelegate = DirectorsCollectionViewDelegateFlowLayout(presenter: presenter)
    
    // MARK: - View Lifecycle
    override func setupUI() {
        showLoader()
        setupLabels()
        setupCollectionViews()
    }
}

// MARK: - View Protocol
extension MoviesCastVC: MoviesCastView {
    func showCast() {
        actorsCollectionView.reloadData()
        directorsCollectionView.reloadData()
    }
}

// MARK: - CastVCDelegate
extension MoviesCastVC: CastVCDelegate {
    func fetchCast(for moviesIDs: [Int]) {
        presenter.fetchCast(for: moviesIDs)
    }
}

// MARK: - Private helpers
private extension MoviesCastVC {
    func setupLabels() {
        titleLabel.text = "Similar Movies Cast"
        actorsLabel.text = "Actors"
        directorsLabel.text = "Directors"
    }
    
    func setupCollectionViews() {
        for collectionView in [actorsCollectionView, directorsCollectionView] {
            collectionView?.register(cellType: CastCell.self)
            if let flow = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
                flow.scrollDirection = .horizontal
            }
        }
        actorsCollectionView.dataSource = actorsCollectionViewDataSource
        actorsCollectionView.delegate = actorsCollectionViewDelegate
        directorsCollectionView.dataSource = directorsCollectionViewDataSource
        directorsCollectionView.delegate = directorsCollectionViewDelegate
    }
}
