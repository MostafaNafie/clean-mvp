//
//  CastCell.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import UIKit

class CastCell: UICollectionViewCell {
    static let size: CGSize = .init(width: 160, height: 200)
    
    // MARK: - Outlets
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Cell Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = 160 / 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
    }
    
    // MARK: - Public Methods
    func configure(_ cast: Cast) {
        nameLabel.text = cast.name
        profileImageView.setImage(with: cast.profileImageURL, and: Resources.Images.profilePlaceholder)
    }
}
