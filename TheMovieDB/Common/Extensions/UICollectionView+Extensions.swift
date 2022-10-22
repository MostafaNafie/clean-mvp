//
//  UICollectionView+Extensions.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 22/10/2022.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(cellType: T.Type) {
        let nib = UINib(nibName: cellType.identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: cellType.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath, reuseIdentifier: String? = nil) -> T {
        let cell = self.dequeueReusableCell(withReuseIdentifier: reuseIdentifier ?? T.identifier, for: indexPath)
        return cell as! T
    }
}

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
