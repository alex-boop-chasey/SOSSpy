// RealDistanceFromHomeService.swift
// Real implementation of DistanceFromHomeService (temporary stub)

/// Real distance from home service implementation
/// Currently returns stub value - real calculation in later step
struct RealDistanceFromHomeService: DistanceFromHomeService {

    func distanceFromHome(
        current: (Double, Double)
    ) async throws -> Double {
        // Temporary stub implementation
        // TODO: Read frozen Bundaberg home coordinates and calculate real distance
        return 10.0
    }
}
