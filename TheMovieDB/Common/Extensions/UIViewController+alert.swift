//
//  UIViewController+alert.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 22/10/2022.
//

import UIKit

extension UIViewController {
    func showAlert(with title: String, and message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(cancel)
    
        present(alertController, animated:true, completion: {
            guard let callback = completion else { return }
            DispatchQueue.main.async {
                callback()
            }
        })
    }
}
