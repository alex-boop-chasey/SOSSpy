// BatterySOSDetector.swift
// Pure function engine for Battery SOS detection
// No async, no side effects, no OS types

/// Detects if the user is in a Battery SOS state
/// (low battery percentage far from home)
struct BatterySOSDetector {

    /// Determines if the user is in Battery SOS state
    /// - Parameters:
    ///   - batteryPercent: Current battery percentage (0-100)
    ///   - distanceFromHomeKm: Distance from home location in kilometers
    /// - Returns: True if battery is <= 20% AND distance > 50km
    public static func isInSOS(
        batteryPercent: Int,
        distanceFromHomeKm: Double
    ) -> Bool {
        return batteryPercent <= 20 && distanceFromHomeKm > 50
    }
}
