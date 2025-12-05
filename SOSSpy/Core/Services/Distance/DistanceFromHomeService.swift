// DistanceFromHomeService.swift
// Protocol for distance from home calculation

/// Service for calculating distance from home location
protocol DistanceFromHomeService {

    /// Calculate distance from current location to home
    /// - Parameter current: Current coordinates (latitude, longitude)
    /// - Returns: Distance from home in kilometers
    func distanceFromHome(
        current: (Double, Double)
    ) async throws -> Double
}
