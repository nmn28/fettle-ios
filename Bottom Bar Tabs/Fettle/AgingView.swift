//
//  AgingView.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/9/24.
//

import SwiftUI

struct AgingView: View {
    var body: some View {
        VStack (spacing: 10) {
            HStack {
                Image("placeholder/user")
                Text("Jane Doe")
                    .font(.title2)
            }
            CustomBoxView(title: "Aging", value: "Slow", unit: "", percentile: "75th", leaderboard: "#7", symbolName: "clock", destination: Text("Aging Details"))
                .padding(.bottom, 40)
            SubBoxView(title: "Epigenetics", value: "Slow", unit: "", percentile: "75th", leaderboard: "#7", symbolName: "clock", destination: Text("Aging Details"))
            SubBoxView(title: "Scenescense", value: "Slow", unit: "", percentile: "75th", leaderboard: "#7", symbolName: "clock", destination: Text("Aging Details"))
            SubBoxView(title: "Mitochondria", value: "Slow", unit: "", percentile: "75th", leaderboard: "#7", symbolName: "clock", destination: Text("Aging Details"))
        }
        .padding()
        Spacer()
    }
}

#Preview {
    AgingView()
}
