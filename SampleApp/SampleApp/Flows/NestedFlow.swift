//
//  NestedFlow.swift
//  SampleApp
//
//  Created by Konstantin Zyrianov on 2024-09-26.
//

import Navigation
import SwiftUI

enum NestedFlow: Flow {
    case nested
    case destedDetails

    func body(coordinator: any FlowCoordinator) -> some View {
        switch self {
        case .nested:
            NavigationLink(value: NestedFlow.destedDetails) {
                Text("Present nested details")
            }
        case .destedDetails:
            Text("Nested details")
        }
    }
}
