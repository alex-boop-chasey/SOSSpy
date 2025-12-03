import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "bolt.batteryblock.exclamationmark")
                    .font(.system(size: 60))
                    .foregroundStyle(.red)
                    .symbolEffect(.pulse)

                Text("SOSSpy")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Battery SOS + EV Routing Prototype")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Divider()
                    .padding(.vertical)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Ready to test:")
                        .font(.headline)
                        .padding(.bottom, 4)

                    FeatureRow(icon: "car.fill", text: "Apple EV Routing Data API", color: .blue)
                    FeatureRow(icon: "battery.25", text: "Battery level monitoring", color: .red)
                    FeatureRow(icon: "location.fill", text: "Distance to home calculation", color: .green)
                    FeatureRow(icon: "bolt.car.fill", text: "Tesla Fleet API fallback", color: .purple)
                    FeatureRow(icon: "exclamationmark.triangle.fill", text: "SOS alert triggers", color: .orange)
                }
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(12)

                Spacer()

                VStack(spacing: 8) {
                    Text("Entitlements Required:")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.orange)

                    HStack(spacing: 16) {
                        VStack {
                            Image(systemName: "car.circle.fill")
                            Text("EV Routing")
                                .font(.caption2)
                        }
                        VStack {
                            Image(systemName: "location.circle.fill")
                            Text("Location")
                                .font(.caption2)
                        }
                    }
                    .foregroundStyle(.orange)
                }
                .padding()
                .background(.orange.opacity(0.1))
                .cornerRadius(12)
            }
            .padding()
            .navigationTitle("SOSSpy Prototype")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FeatureRow: View {
    let icon: String
    let text: String
    let color: Color

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(color)
                .frame(width: 24)
            Text(text)
                .font(.subheadline)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
