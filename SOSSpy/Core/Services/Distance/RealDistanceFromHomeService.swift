// RealDistanceFromHomeService.swift
// Real implementation of DistanceFromHomeService

import Foundation
import CoreLocation

/// Real distance from home service implementation
/// Calculates distance using haversine formula with frozen Bundaberg coordinates
struct RealDistanceFromHomeService: DistanceFromHomeService {

    private let homeCoordinates = (-24.8658, 152.3489) // Bundaberg, QLD
    private let earthRadiusKm = 6371.0

    func distanceFromHome(
        current: (Double, Double)
    ) async throws -> Double {
        // Try to get actual device/simulator location
        let actualLocation: (Double, Double)
        if let location = CLLocationManager().location {
            actualLocation = (location.coordinate.latitude, location.coordinate.longitude)
        } else {
            // Fall back to input tuple if location unavailable
            actualLocation = current
        }

        let lat1 = homeCoordinates.0 * .pi / 180.0
        let lon1 = homeCoordinates.1 * .pi / 180.0
        let lat2 = actualLocation.0 * .pi / 180.0
        let lon2 = actualLocation.1 * .pi / 180.0

        let dLat = lat2 - lat1
        let dLon = lon2 - lon1

        let a = sin(dLat / 2) * sin(dLat / 2) +
                cos(lat1) * cos(lat2) *
                sin(dLon / 2) * sin(dLon / 2)
        let c = 2 * atan2(sqrt(a), sqrt(1 - a))

        return earthRadiusKm * c
    }
}
