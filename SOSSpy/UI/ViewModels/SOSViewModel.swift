// SOSViewModel.swift
// ViewModel for Battery SOS screen

import Observation

@Observable
@MainActor
final class SOSViewModel {

    // MARK: - Services

    let routingService: EVRoutingService
    let distanceService: DistanceFromHomeService

    // MARK: - State

    var batteryPercent: Int = 50
    var currentLocation: (Double, Double) = (-24.8658, 152.3489)
    var distanceFromHomeKm: Double = 0
    var isSOS: Bool = false
    var routePlan: RoutePlan? = nil

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

    func loadRoutePreview() async {
        do {
            let plan = try await routingService.calculateRoute(
                from: currentLocation,
                to: (-24.8127, 152.4599) // Bargara mock destination
            )
            routePlan = plan
        } catch {
            routePlan = nil
        }
    }
}
