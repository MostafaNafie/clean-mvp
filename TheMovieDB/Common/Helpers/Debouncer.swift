//
//  Debouncer.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

final class Debouncer {
    // MARK: - Properties
    private let delay: TimeInterval
    private var pendingWorkItem: DispatchWorkItem?

    // MARK: - Init
    init(delay: TimeInterval) {
        self.delay = delay
    }

    // MARK: - Public Methods
    /// Trigger the action after some delay
    func run(action: @escaping () -> Void) {
        pendingWorkItem?.cancel()
        pendingWorkItem = DispatchWorkItem(block: action)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: pendingWorkItem!)
    }
}
