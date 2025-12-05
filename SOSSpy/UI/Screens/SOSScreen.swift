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

            if let plan = viewModel.routePlan {
                Text("Route distance: \(plan.distanceKm, specifier: "%.1f") km")
                Text("Travel time: \(plan.expectedTravelTimeMinutes) min")
            }
        }
        .padding()
        .task {
            await viewModel.updateState()
            await viewModel.loadRoutePreview()
        }
    }
}
