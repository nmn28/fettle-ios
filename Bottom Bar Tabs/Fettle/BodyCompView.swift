//
//  BodyCompView.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/8/24.
//

import SwiftUI

struct BodyCompView: View {
    var body: some View {
        VStack (spacing: 10) {
            HStack {
                Image("placeholder/user")
                Text("Jane Doe")
                    .font(.title2)
            }
        CustomBoxView(title: "Body Composition", value: "18%", unit: "fat", percentile: "80th", leaderboard: "#1242", symbolName: "scalemass", destination: Text("Body Composition Details"))
                .padding(.bottom, 40)
        SubBoxView(title: "Muscle Gain", value: "5", unit: "lbs increase", percentile: "80th", leaderboard: "#664", symbolName: "figure.cross.training", destination: Text("Muscle Gain Details"))
                    SubBoxView(title: "Weight Loss", value: "2%", unit: "decrease", percentile: "80th", leaderboard: "#3456", symbolName: "lines.measurement.horizontal", destination: Text("Weight Loss Details"))
                    SubBoxView(title: "Grip Strength", value: "50", unit: "second dead hang hold", percentile: "80th", leaderboard: "#1145", symbolName: "hand.raised.fingers.spread", destination: Text("Grip Strength Details"))
                }
        .padding()
                Spacer()
            }
    
        }

        struct SubBoxView<Destination: View>: View {
            let title: String
            let value: String
            let unit: String
            let percentile: String
            let leaderboard: String
            let symbolName: String
            let destination: Destination
            
            var body: some View {
                NavigationLink(destination: destination) {
                    HStack(alignment: .center) {
                        Image(systemName: symbolName)
                            .foregroundColor(.black)
                            .font(.headline)
                            .frame(width: 30) // Ensures consistent spacing
                        
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Text(title)
                                    .foregroundColor(.black)
                                    .font(.subheadline)
                                Spacer()
                                Text("\(value) \(unit)")
                                    .foregroundColor(.black)
                                    .font(.subheadline)
                            }
                            HStack {
                                Text("Percentile: \(percentile)")
                                    .foregroundColor(.black)
                                    .font(.caption)
                                Spacer()
                                Text("Leaderboard: \(leaderboard)")
                                    .foregroundColor(.black)
                                    .font(.caption)
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(color: .gray, radius: 2, x: 0, y: 1)
                    .padding(.horizontal)
                }
            }
        }

#Preview {
    BodyCompView()
}
