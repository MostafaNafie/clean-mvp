//
//  CastCell.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import UIKit

class CastCell: UICollectionViewCell {
    static let size: CGSize = .init(width: 200, height: 200)
    
    // MARK: - Outlets
    @IBOutlet private weak var profileImageView: UIImageView!
    
    // MARK: - Cell Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = 200 / 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
    }
    
    // MARK: - Public Methods
    func configure(_ cast: Cast) {
        profileImageView.setImage(with: cast.profileImageURL, and: "profile-placeholder")
    }
}
