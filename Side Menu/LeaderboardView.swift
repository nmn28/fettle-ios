//
//  LeaderboardView.swift
//  market
//
//  Created by Nicholas Nelson on 4/17/24.
//

import SwiftUI

struct LeaderboardView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                GroupBox(label: HStack {
                    Image(systemName: "person.badge.clock")
                        .imageScale(.large)
                    Text("Biological Age")
                }) {
                    VStack(alignment: .leading) {
                        Text("Youngest Age")
                        Text("Most Improved Age")
                        Text("Highest Age Decrease Rate")
                        Text("Top 1% Achievers")
                    }
                    .padding(.vertical, 5)
                }
                
                GroupBox(label: HStack {
                    Image(systemName: "scalemass")
                        .imageScale(.large)
                    Text("Body Composition")
                }) {
                    VStack(alignment: .leading) {
                        Text("Lowest Body Fat")
                        Text("Highest Muscle Gain")
                        Text("Best Weight Loss")
                        Text("Top 1% Achievers")
                    }
                    .padding(.vertical, 5)
                }
                
                GroupBox(label: HStack {
                    Image(systemName: "brain")
                        .imageScale(.large)
                    Text("Cognitive Health")
                }) {
                    VStack(alignment: .leading) {
                        Text("Highest Cognitive Score")
                        Text("Most Improved Cognitive Score")
                        Text("Top 1% Achievers")
                    }
                    .padding(.vertical, 5)
                }
                
                GroupBox(label: HStack {
                    Image(systemName: "flame")
                        .imageScale(.large)
                    Text("Metabolic Health")
                }) {
                    VStack(alignment: .leading) {
                        Text("Best Metabolic Rate")
                        Text("Most Improved Metabolic Rate")
                        Text("Top 1% Achievers")
                    }
                    .padding(.vertical, 5)
                }
                
                GroupBox(label: HStack {
                    Image(systemName: "leaf")
                        .imageScale(.large)
                    Text("Gut Health")
                }) {
                    VStack(alignment: .leading) {
                        Text("Best Gut Health")
                        Text("Most Improved Gut Health")
                        Text("Top 1% Achievers")
                    }
                    .padding(.vertical, 5)
                }
                
                GroupBox(label: HStack {
                    Image(systemName: "drop")
                        .imageScale(.large)
                    Text("Hormones")
                }) {
                    VStack(alignment: .leading) {
                        Text("Best Hormonal Balance")
                        Text("Most Improved Hormonal Balance")
                        Text("Top 1% Achievers")
                    }
                    .padding(.vertical, 5)
                }
                
                GroupBox(label: HStack {
                    Image(systemName: "clock")
                        .imageScale(.large)
                    Text("Aging")
                }) {
                    VStack(alignment: .leading) {
                        Text("Slowest Aging Rate")
                        Text("Most Improved Aging Rate")
                        Text("Top 1% Achievers")
                    }
                    .padding(.vertical, 5)
                }
                
                GroupBox(label: HStack {
                    Image(systemName: "bandage")
                        .imageScale(.large)
                    Text("Toxins")
                }) {
                    VStack(alignment: .leading) {
                        Text("Lowest Toxin Levels")
                        Text("Most Improved Toxin Levels")
                        Text("Top 1% Achievers")
                    }
                    .padding(.vertical, 5)
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    LeaderboardView()
}
