//
//  UIImageView+setImage.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with url: URL, and placeholder: String = Resources.Images.posterPlaceholder) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url,
                         placeholder: UIImage(named: placeholder),
                         options: [.transition(.fade(0.3))])
    }
}
