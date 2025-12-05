// MockEVRoutingService.swift
// Mock implementation of EVRoutingService for testing

/// Mock EV routing service with deterministic values
/// Returns Bargara short route from Test_Locations_and_Scenarios.md
struct MockEVRoutingService: EVRoutingService, Sendable {

    func calculateRoute(
        from start: (Double, Double),
        to end: (Double, Double)
    ) async throws -> RoutePlan {
        // Deterministic mock values (Bargara short route)
        return RoutePlan(
            distanceKm: 11.4,
            expectedTravelTimeMinutes: 20
        )
    }
}
