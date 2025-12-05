// EVRoutingService.swift
// Protocol for EV routing services

/// Route plan containing distance and travel time
struct RoutePlan {
    let distanceKm: Double
    let expectedTravelTimeMinutes: Int
}

/// Service for calculating EV routes
protocol EVRoutingService: Sendable {

    /// Calculate route from start to end coordinates
    /// - Parameters:
    ///   - start: Starting coordinates (latitude, longitude)
    ///   - end: Ending coordinates (latitude, longitude)
    /// - Returns: Route plan with distance and travel time
    func calculateRoute(
        from start: (Double, Double),
        to end: (Double, Double)
    ) async throws -> RoutePlan
}
