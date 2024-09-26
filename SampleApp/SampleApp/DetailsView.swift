//
//  DetailsView.swift
//  SampleApp
//
//  Created by Konstantin Zyrianov on 2024-09-26.
//

import SwiftUI

struct DetailsView: View {
    let id: Int
    let flowActions: FlowActions

    var body: some View {
        Text("Details: \(id)")
        Button("Present nested") {
            flowActions.tapPresentOther()
        }
    }
}

extension DetailsView {
    struct FlowActions {
        let tapPresentOther: () -> Void
    }
}

#Preview {
    DetailsView(
        id: 1,
        flowActions: .init(tapPresentOther: {})
    )
}
