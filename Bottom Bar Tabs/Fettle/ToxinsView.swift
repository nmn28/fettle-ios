//
//  ToxinsView.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/9/24.
//

import SwiftUI

struct ToxinsView: View {
    var body: some View {
        VStack (spacing: 10) {
            HStack {
                Image("placeholder/user")
                Text("Jane Doe")
                    .font(.title2)
            }
            CustomBoxView(title: "Toxins", value: "Low", unit: "", percentile: "92nd", leaderboard: "#8", symbolName: "bandage", destination: Text("Toxins Details"))
                .padding(.bottom, 40)
            SubBoxView(title: "Plastics", value: "Low", unit: "", percentile: "92nd", leaderboard: "#8", symbolName: "bandage", destination: Text("Toxins Details"))
            SubBoxView(title: "Heavy Metals", value: "Low", unit: "", percentile: "92nd", leaderboard: "#8", symbolName: "bandage", destination: Text("Toxins Details"))
            SubBoxView(title: "Mold", value: "Low", unit: "", percentile: "92nd", leaderboard: "#8", symbolName: "bandage", destination: Text("Toxins Details"))
        }
        .padding()
        Spacer()
    }
}

#Preview {
    ToxinsView()
}
