// SOSViewModel.swift
// ViewModel for Battery SOS screen

import SwiftUI

@Observable
final class SOSViewModel {

    // MARK: - Services

    let routingService: EVRoutingService
    let distanceService: DistanceFromHomeService

    // MARK: - State

    var batteryPercent: Int = 50
    var currentLocation: (Double, Double) = (-24.8658, 152.3489)
    var distanceFromHomeKm: Double = 0
    var isSOS: Bool = false

    // MARK: - Initialization

    init(
        routingService: EVRoutingService,
        distanceService: DistanceFromHomeService
    ) {
        self.routingService = routingService
        self.distanceService = distanceService
    }

    // MARK: - Actions

    func updateState() async {
        do {
            // Calculate distance from home
            distanceFromHomeKm = try await distanceService.distanceFromHome(
                current: currentLocation
            )

            // Update SOS status using pure engine
            isSOS = BatterySOSDetector.isInSOS(
                batteryPercent: batteryPercent,
                distanceFromHomeKm: distanceFromHomeKm
            )
        } catch {
            // Handle error silently for now
            distanceFromHomeKm = 0
            isSOS = false
        }
    }
}
