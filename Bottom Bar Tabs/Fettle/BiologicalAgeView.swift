//
//  BiologicalAgeView.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/8/24.
//

import SwiftUI

struct BiologicalAgeView: View {
    var body: some View {
        VStack (spacing:10) {
            HStack {
                Image("placeholder/user")
                Text("Jane Doe")
                    .font(.title2)
            }
            CustomBoxView(title: "Biological Age", value: "30", unit: "years", percentile: "90th", leaderboard: "#1", symbolName: "person.badge.clock", destination: Text("Biological Age Details"))
                .padding(.bottom,40)
        }
        .padding()
        Spacer()
    }
}

#Preview {
    BiologicalAgeView()
}
