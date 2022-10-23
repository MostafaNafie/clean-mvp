//
//  MoviesCastVC.swift
//  TheMovieDB
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
    @IBOutlet private weak var actorsCollectionView: UICollectionView!
    
    // MARK: - Properties
    private lazy var actorsCollectionViewDataSource = ActorsCollectionViewDataSource(presenter: presenter)
    private lazy var actorsCollectionViewDelegate = ActorsCollectionViewDelegateFlowLayout(presenter: presenter)
    
    // MARK: - View Lifecycle
    override func setupUI() {
        titleLabel.text = "Similar Movies Cast"
        showLoader()
        setupCollectionView()
    }
}

// MARK: - View Protocol
extension MoviesCastVC: MoviesCastView {
    func showCast() {
        actorsCollectionView.reloadData()
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
    func setupCollectionView() {
        actorsCollectionView.register(cellType: CastCell.self)
        actorsCollectionView.dataSource = actorsCollectionViewDataSource
        actorsCollectionView.delegate = actorsCollectionViewDelegate
        actorsCollectionView.showsHorizontalScrollIndicator = false
        actorsCollectionView.showsVerticalScrollIndicator = false
        if let flow = actorsCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flow.scrollDirection = .horizontal
        }
    }
}
