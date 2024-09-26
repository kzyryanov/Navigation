//
//  Flow.swift
//  Navigation
//
//  Created by Konstantin Zyrianov on 2024-09-26.
//

import SwiftUI

public protocol Flow: Hashable {
    associatedtype Body: View

    @MainActor @ViewBuilder
    func body(coordinator: FlowCoordinator) -> Body
}

/// Empty flow always returns empty view.
///
/// Can be used for previews
public enum EmptyFlow: Flow {
    case empty

    public func body(coordinator: any FlowCoordinator) -> some View {
        EmptyView()
    }
}
