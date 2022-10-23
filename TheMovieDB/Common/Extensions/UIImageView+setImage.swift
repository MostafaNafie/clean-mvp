//
//  UIImageView+setImage.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with url: URL) {
        self.kf.setImage(with: url,
                         placeholder: UIImage(named: "poster-placeholder"),
                         options: [.transition(.fade(0.3))])
    }
}
