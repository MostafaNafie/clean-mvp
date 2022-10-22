//
//  SimilarMoviesCollectionViewDataSource.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 22/10/2022.
//

import UIKit

final class SimilarMoviesCollectionViewDataSource: NSObject {
    // MARK: - Properties
    private let presenter: SimilarMoviesPresenter
    
    init(presenter: SimilarMoviesPresenter) {
        self.presenter = presenter
    }
}

extension SimilarMoviesCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.moviesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SimilarMovieCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
}
