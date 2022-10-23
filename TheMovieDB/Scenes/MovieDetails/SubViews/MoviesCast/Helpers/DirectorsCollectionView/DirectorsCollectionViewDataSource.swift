//
//  DirectorsCollectionViewDataSource.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import UIKit

final class DirectorsCollectionViewDataSource: NSObject {
    // MARK: - Properties
    private let presenter: MoviesCastPresenter
    
    init(presenter: MoviesCastPresenter) {
        self.presenter = presenter
    }
}

extension DirectorsCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.directorsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CastCell = collectionView.dequeueReusableCell(for: indexPath)
        let director = presenter.director(at: indexPath.row)
        cell.configure(director)
        return cell
    }
}
