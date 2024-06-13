//
//  GutHealthView.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/9/24.
//

import SwiftUI

struct GutHealthView: View {
    var body: some View {
        VStack (spacing: 10) {
            HStack {
                Image("placeholder/user")
                Text("Jane Doe")
                    .font(.title2)
            }
            CustomBoxView(title: "Gut Health", value: "Good", unit: "", percentile: "85th", leaderboard: "#5", symbolName: "leaf", destination: Text("Gut Health Details"))
                .padding(.bottom, 40)
            SubBoxView(title: "Microbiome Diversity", value: "Good", unit: "", percentile: "85th", leaderboard: "#5", symbolName: "microbe", destination: Text("Gut Health Details"))
            SubBoxView(title: "Digestion", value: "Good", unit: "", percentile: "85th", leaderboard: "#5", symbolName: "leaf", destination: Text("Gut Health Details"))
            SubBoxView(title: "Nutrient Absorption", value: "Good", unit: "", percentile: "85th", leaderboard: "#5", symbolName: "leaf", destination: Text("Gut Health Details"))
        }
        .padding()
        Spacer()
    }
}

#Preview {
    GutHealthView()
}
