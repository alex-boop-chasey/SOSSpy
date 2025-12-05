// RealEVRoutingService.swift
// Real implementation of EVRoutingService (temporary stub)

/// Real EV routing service implementation
/// Currently returns stub values - Apple Maps integration in later step
struct RealEVRoutingService: EVRoutingService {

    func calculateRoute(
        from start: (Double, Double),
        to end: (Double, Double)
    ) async throws -> RoutePlan {
        // Temporary stub implementation
        // TODO: Integrate Apple Maps EV routing in next step
        return RoutePlan(
            distanceKm: 10,
            expectedTravelTimeMinutes: 15
        )
    }
}
