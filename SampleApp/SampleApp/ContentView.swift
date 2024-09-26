//
//  ContentView.swift
//  SampleApp
//
//  Created by Konstantin Zyrianov on 2024-09-26.
//

import Navigation
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationFlowView<AppFlow, NestedFlow>(root: AppFlow.home)
    }
}

#Preview {
    ContentView()
}
