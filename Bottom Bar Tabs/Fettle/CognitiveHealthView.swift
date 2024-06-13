//
//  CognitiveHealthView.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/9/24.
//

import SwiftUI

struct CognitiveHealthView: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image("placeholder/user")
                Text("Jane Doe")
                    .font(.title2)
            }
            CustomBoxView(title: "Cognitive Health", value: "Excellent", unit: "", percentile: "95th", leaderboard: "#3", symbolName: "brain", destination: Text("Cognitive Health Details"))
                .padding(.bottom, 40)
            SubBoxView(title: "Focus", value: "Excellent", unit: "", percentile: "95th", leaderboard: "#3", symbolName: "brain", destination: Text("Cognitive Health Details"))
            SubBoxView(title: "Memory", value: "Excellent", unit: "", percentile: "95th", leaderboard: "#3", symbolName: "brain", destination: Text("Cognitive Health Details"))
            SubBoxView(title: "Mental Acuity", value: "Excellent", unit: "", percentile: "95th", leaderboard: "#3", symbolName: "brain", destination: Text("Cognitive Health Details"))
        }
        .padding()
        Spacer()
    }
}

#Preview {
    CognitiveHealthView()
}
