//
//  ContentView.swift
//  BetterMe
//
//  Created by Benjamin Cofrancesco on 7/1/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("BetterMe")
                    .font(.largeTitle)
                    .foregroundStyle(Theme.textSecondary)
            }
        }
    }
}

#Preview {
    ContentView()
}
