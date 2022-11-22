//
//  UIViewcontroller+activityIndicator.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 22/10/2022.
//

import UIKit

extension UIViewController {
    func showLoader() {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.startAnimating()
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.tag = 777
        view.addSubview(indicatorView)
        indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func hideLoader() {
        if let subViews = view.viewWithTag(777) {
            subViews.removeFromSuperview()
        }
    }
}
