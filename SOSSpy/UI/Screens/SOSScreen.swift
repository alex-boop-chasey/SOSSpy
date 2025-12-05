// SOSScreen.swift
// Minimal Battery SOS screen

import SwiftUI

struct SOSScreen: View {
    @Bindable var viewModel: SOSViewModel

    var body: some View {
        VStack(spacing: 12) {
            Text("Battery: \(viewModel.batteryPercent)%")
            Text("Distance from home: \(viewModel.distanceFromHomeKm, specifier: "%.1f") km")
            Text(viewModel.isSOS ? "⚠️ SOS" : "Safe")
        }
        .padding()
        .task { await viewModel.updateState() }
    }
}
