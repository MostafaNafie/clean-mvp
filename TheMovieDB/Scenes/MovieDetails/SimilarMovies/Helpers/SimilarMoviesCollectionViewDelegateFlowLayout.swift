//
//  SimilarMoviesCollectionViewDelegateFlowLayout.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 22/10/2022.
//

import UIKit

final class SimilarMoviesCollectionViewDelegateFlowLayout: NSObject {
    // MARK: - Properties
    private let presenter: SimilarMoviesPresenter
    
    init(presenter: SimilarMoviesPresenter) {
        self.presenter = presenter
    }
}

extension SimilarMoviesCollectionViewDelegateFlowLayout: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 200, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 20, bottom: 0, right: 20)
    }
}
