// SOSScreen.swift
// Minimal Battery SOS screen

import SwiftUI

struct SOSScreen: View {

    @Bindable var viewModel: SOSViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Battery: \(viewModel.batteryPercent)%")
                .font(.title2)

            Text("Distance from home: \(String(format: "%.1f", viewModel.distanceFromHomeKm)) km")
                .font(.title2)

            Text(viewModel.isSOS ? "Status: ⚠️ SOS" : "Status: Safe")
                .font(.title)
                .foregroundStyle(viewModel.isSOS ? .red : .green)
        }
        .padding()
        .task {
            await viewModel.updateState()
        }
    }
}
