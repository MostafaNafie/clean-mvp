//
//  Debouncer.swift
//  TheMovieDB
//
//  Created by Mostafa Nafie on 21/10/2022.
//

import Foundation

class Debouncer {
    private let delay: TimeInterval
    private var pendingWorkItem: DispatchWorkItem?

    public init(delay: TimeInterval) {
        self.delay = delay
    }

    /// Trigger the action after some delay
    public func run(action: @escaping () -> Void) {
        pendingWorkItem?.cancel()
        pendingWorkItem = DispatchWorkItem(block: action)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: pendingWorkItem!)
    }
}
