//
//  Coordinator.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import UIKit

protocol Coordinator: AnyObject {
    init(factory: Factory, navigationController: UINavigationController)

    func start()
}
