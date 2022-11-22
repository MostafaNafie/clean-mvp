//
//  ActorsCollectionViewDelegateFlowLayout.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import UIKit

final class ActorsCollectionViewDelegateFlowLayout: NSObject {
    // MARK: - Properties
    private let presenter: MoviesCastPresenter
    
    init(presenter: MoviesCastPresenter) {
        self.presenter = presenter
    }
}

extension ActorsCollectionViewDelegateFlowLayout: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CastCell.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
}
