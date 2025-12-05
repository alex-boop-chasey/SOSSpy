// BatterySOSDetectorTests.swift
// Deterministic unit tests for BatterySOSDetector pure engine
// Uses frozen values from Test_Locations_and_Scenarios.txt

import XCTest
@testable import SOSSpy

final class BatterySOSDetectorTests: XCTestCase {

    func test_SafeScenario() {
        // battery=25, distance=45.0 → expected false
        let result = BatterySOSDetector.isInSOS(
            batteryPercent: 25,
            distanceFromHomeKm: 45.0
        )
        XCTAssertFalse(result, "Safe scenario should not trigger SOS")
    }

    func test_EdgeScenario() {
        // battery=21, distance=49.0 → expected false
        let result = BatterySOSDetector.isInSOS(
            batteryPercent: 21,
            distanceFromHomeKm: 49.0
        )
        XCTAssertFalse(result, "Edge scenario should not trigger SOS")
    }

    func test_ExactTriggerScenario() {
        // battery=20, distance=51.0 → expected true
        let result = BatterySOSDetector.isInSOS(
            batteryPercent: 20,
            distanceFromHomeKm: 51.0
        )
        XCTAssertTrue(result, "Exact trigger scenario should trigger SOS")
    }

    func test_ClearTriggerScenario() {
        // battery=12, distance=80.0 → expected true
        let result = BatterySOSDetector.isInSOS(
            batteryPercent: 12,
            distanceFromHomeKm: 80.0
        )
        XCTAssertTrue(result, "Clear trigger scenario should trigger SOS")
    }

    func test_HighBatteryScenario() {
        // battery=90, distance=300.0 → expected false
        let result = BatterySOSDetector.isInSOS(
            batteryPercent: 90,
            distanceFromHomeKm: 300.0
        )
        XCTAssertFalse(result, "High battery scenario should not trigger SOS")
    }
}
