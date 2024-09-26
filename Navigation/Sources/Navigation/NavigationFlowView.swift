//
//  NavigationFlowView.swift
//  Navigation
//
//  Created by Konstantin Zyrianov on 2024-09-26.
//

import SwiftUI

public struct NavigationFlowView<Root: Flow, each Route: Flow>: View {
    @State private var coordinator: FlowCoordinator

    public init(
        coordinator: FlowCoordinator = DefaultFlowCoordinator(),
        root: Root
    ) {
        self._coordinator = State(wrappedValue: coordinator)
        self.root = root
    }

    private let root: Root

    public var body: some View {
        NavigationStack(path: $coordinator.path) {
            root.body(coordinator: coordinator)
                .navigateAll(
                    coordinator: coordinator,
                    routes: (Root.self, repeat (each Route).self)
                )
        }
    }
}

private extension View {
    func navigateAll<each Route: Flow>(
        coordinator: FlowCoordinator,
        routes: (repeat (each Route).Type)
    ) -> some View {
        var view = AnyView(self)

        for t in repeat each routes {
            view = AnyView(view.navigationDestination(for: t, destination: { route in
                route.body(coordinator: coordinator)
            }))
        }

        return view
    }
}
