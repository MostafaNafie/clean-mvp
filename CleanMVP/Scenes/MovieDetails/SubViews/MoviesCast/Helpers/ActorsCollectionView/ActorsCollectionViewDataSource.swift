//
//  ActorsCollectionViewDataSource.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import UIKit

final class ActorsCollectionViewDataSource: NSObject {
    // MARK: - Properties
    private let presenter: MoviesCastPresenter
    
    init(presenter: MoviesCastPresenter) {
        self.presenter = presenter
    }
}

extension ActorsCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.actorsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CastCell = collectionView.dequeueReusableCell(for: indexPath)
        let actor = presenter.actor(at: indexPath.row)
        cell.configure(actor)
        return cell
    }
}
