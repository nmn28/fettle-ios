//
//  HormonesView.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/9/24.
//

import SwiftUI

struct HormonesView: View {
    var body: some View {
        VStack (spacing: 10) {
            HStack {
                Image("placeholder/user")
                Text("Jane Doe")
                    .font(.title2)
            }
            CustomBoxView(title: "Hormones", value: "Balanced", unit: "", percentile: "88th", leaderboard: "#6", symbolName: "drop", destination: Text("Hormones Details"))
                .padding(.bottom, 40)
            SubBoxView(title: "Testosterone", value: "Balanced", unit: "", percentile: "88th", leaderboard: "#6", symbolName: "drop", destination: Text("Hormones Details"))
            SubBoxView(title: "Free Testosterone", value: "Balanced", unit: "", percentile: "88th", leaderboard: "#6", symbolName: "drop", destination: Text("Hormones Details"))
            SubBoxView(title: "Thyroid", value: "Balanced", unit: "", percentile: "88th", leaderboard: "#6", symbolName: "drop", destination: Text("Hormones Details"))
        }
        .padding()
        Spacer()
    }
}

#Preview {
    HormonesView()
}
