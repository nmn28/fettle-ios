//
//  MetabolicHealthView.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/9/24.
//

import SwiftUI

struct MetabolicHealthView: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image("placeholder/user")
                Text("Jane Doe")
                    .font(.title2)
            }
            CustomBoxView(title: "Metabolic Health", value: "Normal", unit: "", percentile: "70th", leaderboard: "#4", symbolName: "flame", destination: Text("Metabolic Health Details"))
                .padding(.bottom, 40)
            SubBoxView(title: "HbA1c", value: "Normal", unit: "", percentile: "70th", leaderboard: "#4", symbolName: "testtube.2", destination: Text("Metabolic Health Details"))
            SubBoxView(title: "VO2 Max", value: "Normal", unit: "", percentile: "70th", leaderboard: "#4", symbolName: "lungs", destination: Text("Metabolic Health Details"))
            SubBoxView(title: "Energy", value: "Normal", unit: "", percentile: "70th", leaderboard: "#4", symbolName: "burst", destination: Text("Metabolic Health Details"))
        }
        .padding()
        Spacer()
    }
}

#Preview {
    MetabolicHealthView()
}
