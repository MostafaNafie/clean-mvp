//
//  MovieDetailsContainerVC.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit

final class MovieDetailsContainerVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak private var movieDetailsContainerView: UIView!
    
    // MARK: - Properties
    private let movieDetailsVC: UIViewController
    
    // MARK: - Init
    init(movieDetailsVC: UIViewController) {
        self.movieDetailsVC = movieDetailsVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViewContainers()
    }
}

// MARK: - Private Helpers
private extension MovieDetailsContainerVC {
    func setupSubViewContainers() {
        add(childVC: movieDetailsVC, to: movieDetailsContainerView)
    }
}
