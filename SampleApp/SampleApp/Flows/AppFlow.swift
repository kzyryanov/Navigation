//
//  AppFlow.swift
//  SampleApp
//
//  Created by Konstantin Zyrianov on 2024-09-26.
//

import Navigation
import SwiftUI

enum AppFlow: Flow {
    case home
    case details(id: Int)

    func body(coordinator: any FlowCoordinator) -> some View {
        switch self {
        case .home:
            HomeView(flowActions: .init(
                detailsNavigationValue: { id in
                    AppFlow.details(id: id)
                }
            ))
        case .details(let id):
            DetailsView(
                id: id,
                flowActions: .init(tapPresentOther: {
                    coordinator.push(route: NestedFlow.nested)
                })
            )
        }
    }
}
