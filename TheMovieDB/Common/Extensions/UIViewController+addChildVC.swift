//
//  UIViewController+addChildVC.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit

extension UIViewController {
    func add(childVC child: UIViewController, to view: UIView) {
        child.willMove(toParent: self)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(child.view)
        self.addChild(child)
        child.didMove(toParent: self)
        NSLayoutConstraint.activate([
            child.view.topAnchor.constraint(equalTo: view.topAnchor),
            child.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            child.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        child.view.layoutIfNeeded()
    }
}
