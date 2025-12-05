// MockDistanceFromHomeService.swift
// Mock implementation of DistanceFromHomeService for testing

/// Mock distance from home service with deterministic values
/// Returns Bargara test distance from Test_Locations_and_Scenarios.md
struct MockDistanceFromHomeService: DistanceFromHomeService, Sendable {

    func distanceFromHome(
        current: (Double, Double)
    ) async throws -> Double {
        // Deterministic mock value (Bargara test distance)
        return 11.4
    }
}
