//
//  FlowCoordinator.swift
//  Navigation
//
//  Created by Konstantin Zyrianov on 2024-09-26.
//

import SwiftUI

public protocol FlowCoordinator: Observable, AnyObject {
    var path: NavigationPath { get set }

    @MainActor
    func push<each Route: Hashable>(route: repeat each Route)
}

extension FlowCoordinator {
    @MainActor
    public func push<each Route: Hashable>(route: repeat each Route) {
        repeat path.append(each route)
    }
}

@Observable
public final class DefaultFlowCoordinator: FlowCoordinator {
    public var path: NavigationPath = NavigationPath()

    public init() {}
}
