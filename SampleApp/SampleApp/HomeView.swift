//
//  HomeView.swift
//  SampleApp
//
//  Created by Konstantin Zyrianov on 2024-09-26.
//

import SwiftUI
import Navigation

struct HomeView: View {
    let flowActions: FlowActions

    var body: some View {
        List {
            ForEach(1...10, id: \.self) { id in
                NavigationLink(
                    value: flowActions.detailsNavigationValue(id),
                    label: {
                        Text("Row \(id)")
                    }
                )
            }
        }
    }
}

extension HomeView {
    struct FlowActions {
        let detailsNavigationValue: (_ id: Int) -> any Flow
    }
}

#Preview {
    NavigationStack {
        HomeView(flowActions: .init(detailsNavigationValue: { id in
            EmptyFlow.empty
        }))
    }
}
