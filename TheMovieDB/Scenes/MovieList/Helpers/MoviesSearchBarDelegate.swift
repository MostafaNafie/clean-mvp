//
//  MoviesSearchBarDelegate.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit

final class MovieListSearchBarDelegate: NSObject {
    // MARK: - Properties
    private let presenter: MovieListPresenter
    private let debouncer = Debouncer(delay: 0.3)
    
    init(presenter: MovieListPresenter) {
        self.presenter = presenter
    }
}

extension MovieListSearchBarDelegate: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.search(with: searchBar.text ?? "")
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        debouncer.run { [weak self] in
            self?.presenter.search(with: searchBar.text ?? "")
            if searchText.isEmpty {
                searchBar.resignFirstResponder()
            }
        }
        
    }
}
