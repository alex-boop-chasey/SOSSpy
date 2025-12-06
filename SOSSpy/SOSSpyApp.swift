import SwiftUI

@main
struct SOSSpyApp: App {
    var body: some Scene {
        WindowGroup {
            SOSScreen(
                viewModel: SOSViewModel(
                    routingService: RealEVRoutingService(),
                    distanceService: MockDistanceFromHomeService()
                )
            )
        }
    }
}
