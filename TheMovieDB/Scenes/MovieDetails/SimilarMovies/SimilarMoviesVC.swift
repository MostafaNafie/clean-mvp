//
//  SimilarMoviesVC.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit

protocol SimilarMoviesView: AnyObject {
    func showMovies()
    func startLoading()
    func stopLoading()
    func showError(with title: String, and message: String)
}

final class SimilarMoviesVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    private lazy var collectionViewDataSource = SimilarMoviesCollectionViewDataSource(presenter: presenter)
    private lazy var collectionViewDelegate = SimilarMoviesCollectionViewDelegateFlowLayout(presenter: presenter)
    
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
        setupUI()
    }
}

// MARK: - View Protocol
extension SimilarMoviesVC: SimilarMoviesView {
    func showMovies() {
        collectionView.reloadData()
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

// MARK: - Private helpers
private extension SimilarMoviesVC {
    func setupUI() {
        titleLabel.text = "Similar Movies"
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.register(cellType: SimilarMovieCell.self)
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        if let flow = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flow.scrollDirection = .horizontal
        }
    }
}