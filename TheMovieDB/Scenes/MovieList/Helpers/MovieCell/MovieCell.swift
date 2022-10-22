//
//  MovieCell.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit
import Kingfisher

final class MovieCell: UITableViewCell {
    static let height: CGFloat = 250
    
    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var releaseYearLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    
    // MARK: - Cell Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.kf.indicatorType = .activity
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
    }
    
    // MARK: - Public Methods
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        releaseYearLabel.text = movie.releaseYear
        overviewLabel.text = movie.overview
        
        let processor = RoundCornerImageProcessor(cornerRadius: 100)
        posterImageView.kf.setImage(with: movie.posterURL,
                                    placeholder: UIImage(named: "poster-placeholder"),
                                    options: [.transition(.fade(0.3)), .processor(processor)])
    }
}
