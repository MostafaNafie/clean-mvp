//
//  BaseVC.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 23/10/2022.
//

import UIKit

protocol BaseView: AnyObject {
    func startLoading()
    func stopLoading()
    func showError(with title: String, and message: String)
}

class BaseVC<ViewProtocol, Presenter>: UIViewController, BaseView where Presenter: BasePresenter<ViewProtocol> {
    // MARK: - Properties
    let presenter: Presenter
    
    // MARK: - Init
    init(presenter: Presenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Overridable Methods
    func setupUI() {}
}

// MARK: - BaseView Protocol
extension BaseVC {
    func startLoading() {
        showLoader()
    }
    
    func stopLoading() {
        hideLoader()
    }
    
    func showError(with title: String, and message: String) {
        showAlert(with: title, and: message)
    }
}
