//
//  FettleOutlookView.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/8/24.
//

import SwiftUI

struct FettleOutlookView: View {
    @State private var showNutritionSheet = false
    @State private var showPlanSheet = false
    @State private var showStackSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Name")
                    Text("Age")
                    Spacer()
                    Text("Occupation")
                }
                .padding()
                HStack {
                    HStack {
                        Image("placeholder/user")
                        Text("Jane Doe")
                            .font(.title2)
                    }
                    Spacer()
                    VStack {
                        Button(action: {
                            showNutritionSheet.toggle()
                        }) {
                            VStack {
                                Image(systemName: "fork.knife")
                                Text("Nutrition")
                                    .font(.caption)
                            }
                        }
                        .sheet(isPresented: $showNutritionSheet) {
                            NutritionView()
                        }
                    }
                    VStack {
                        Button(action: {
                            showPlanSheet.toggle()
                        }) {
                            VStack {
                                Image(systemName: "figure.strengthtraining.traditional")
                                Text("Plan")
                                    .font(.caption)
                            }
                        }
                        .sheet(isPresented: $showPlanSheet) {
                            PlanView()
                        }
                    }
                    VStack {
                        Button(action: {
                            showStackSheet.toggle()
                        }) {
                            VStack {
                                Image(systemName: "pills")
                                Text("Stack")
                                    .font(.caption)
                            }
                        }
                        .sheet(isPresented: $showStackSheet) {
                            StackView()
                        }
                    }
                }
                .padding(.horizontal)
                Text("Biohacker spending $100,000 a year to live until 150 years old. Follow my journey here")
                
                Spacer()
                
                ScrollView {
                    VStack(spacing: 10) {
                        CustomBoxView(title: "Biological Age", value: "30", unit: "years", percentile: "90th", leaderboard: "#1", symbolName: "person.badge.clock", destination: BiologicalAgeView())
                        CustomBoxView(title: "Body Composition", value: "18%", unit: "fat", percentile: "80th", leaderboard: "#2", symbolName: "scalemass", destination: BodyCompView())
                        HStack {
                            
                            Text("You haven't updated this in over a year.")
                            NavigationLink(destination: MarketplaceView()) {
                                HStack {
                                    Text("Buy now")
                                    Image(systemName: "cart")
                                        
                                }
                                
                            }
                            
                            
                        }
                        .padding()
                        .font(.caption)
                        CustomBoxView(title: "Cognitive Health", value: "Excellent", unit: "", percentile: "95th", leaderboard: "#3", symbolName: "brain", destination: CognitiveHealthView())
                        CustomBoxView(title: "Metabolic Health", value: "Normal", unit: "", percentile: "70th", leaderboard: "#4", symbolName: "flame", destination: MetabolicHealthView())
                        CustomBoxView(title: "Gut Health", value: "Good", unit: "", percentile: "85th", leaderboard: "#5", symbolName: "leaf", destination: GutHealthView())
                        CustomBoxView(title: "Hormones", value: "Balanced", unit: "", percentile: "88th", leaderboard: "#6", symbolName: "drop", destination: HormonesView())
                        CustomBoxView(title: "Aging", value: "Slow", unit: "", percentile: "75th", leaderboard: "#7", symbolName: "clock", destination: AgingView())
                        CustomBoxView(title: "Toxins", value: "Low", unit: "", percentile: "92nd", leaderboard: "#8", symbolName: "bandage", destination: ToxinsView())
                    }
                    .padding()
                }
            }
        }
    }
}

struct NutritionView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Nutrition Supplements")) {
                    ForEach(nutritionItems, id: \.self) { item in
                        HStack {
                            Text(item)
                            Spacer()
                            Image(systemName: "cart")
                                .foregroundColor(.blue)
                        }
                    }
                }
                Section(header: Text("Recommended Foods")) {
                    ForEach(recommendedFoods, id: \.self) { food in
                        HStack {
                            Text(food)
                            Spacer()
                            Image(systemName: "cart")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .navigationTitle("Nutrition Details")
        }
    }
    
    private let nutritionItems = ["Multivitamin", "Fish Oil", "Vitamin D", "Probiotics", "Magnesium"]
    private let recommendedFoods = ["Broccoli", "Blueberries", "Almonds", "Salmon", "Quinoa"]
}

struct PlanView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Workout Plans")) {
                    ForEach(workoutPlans, id: \.self) { plan in
                        HStack {
                            Text(plan)
                            Spacer()
                            Image(systemName: "cart")
                                .foregroundColor(.blue)
                        }
                    }
                }
                Section(header: Text("Meal Plans")) {
                    ForEach(mealPlans, id: \.self) { meal in
                        HStack {
                            Text(meal)
                            Spacer()
                            Image(systemName: "cart")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .navigationTitle("Plan Details")
        }
    }
    
    private let workoutPlans = ["Beginner Strength", "Intermediate Cardio", "Advanced HIIT", "Yoga Flow"]
    private let mealPlans = ["Keto Diet", "Mediterranean Diet", "Vegan Diet", "Paleo Diet"]
}

struct StackView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Supplements")) {
                    ForEach(supplements, id: \.self) { supplement in
                        HStack {
                            Text(supplement)
                            Spacer()
                            Image(systemName: "cart")
                                .foregroundColor(.blue)
                        }
                    }
                }
                Section(header: Text("Equipment")) {
                    ForEach(equipment, id: \.self) { item in
                        HStack {
                            Text(item)
                            Spacer()
                            Image(systemName: "cart")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .navigationTitle("Stack Details")
        }
    }
    
    private let supplements = ["Whey Protein", "BCAAs", "Pre-Workout", "Creatine", "Beta-Alanine"]
    private let equipment = ["Resistance Bands", "Dumbbells", "Yoga Mat", "Foam Roller", "Kettlebells"]
}
struct CustomBoxView<Destination: View>: View {
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
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(width: 40) // Ensures consistent spacing
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(title)
                            .foregroundColor(.white)
                            .font(.headline)
                        Spacer()
                        Text("\(value) \(unit)")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    HStack {
                        Text("Percentile: \(percentile)")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        Spacer()
                        Text("Leaderboard: \(leaderboard)")
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 70)
            .background(Color.gray)
            .cornerRadius(5)
            .shadow(color: .gray, radius: 5, x: 0, y: 2)
            .padding(.horizontal)
        }
    }
}

#Preview {
    FettleOutlookView()
}
