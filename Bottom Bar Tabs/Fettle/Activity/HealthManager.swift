//
//  HealthManager.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/6/24.
//

import Foundation
import HealthKit

class HealthManager: ObservableObject {
    
    let healthStore = HKHealthStore()
    
    @Published var calories: Int = 678
    @Published var exercise: Int = 64
    @Published var stand: Int = 9
    
    @Published var activities = [Activity]()
    
    var mockActivities = [
        Activity(title: "Sleep", subtitle: "Today", image: "bed.double", tintColor: .purple, amount: "7.8 hours (86%)"),
        Activity(title: "Today steps", subtitle: "Goal 10,000", image: "figure.walk", tintColor: .green, amount: "12,123"),
        Activity(title: "Today calories", subtitle: "Goal 900", image: "flame", tintColor: .red, amount: "1,241"),
        Activity(title: "Running", subtitle: "This week", image: "figure.walk", tintColor: .green, amount: "60 minutes"),
        Activity(title: "Weight Lifting", subtitle: "This week", image: "dumbbell", tintColor: .cyan, amount: "80 minutes"),
        Activity(title: "Soccer", subtitle: "This week", image: "figure.soccer", tintColor: .blue, amount: "20 minutes"),
        Activity(title: "Basketball", subtitle: "This week", image: "figure.basketball", tintColor: .orange, amount: "18 minutes"),
        Activity(title: "Stair Stepper", subtitle: "This week", image: "figure.stair.stepper", tintColor: .green, amount: "10 minutes"),
        Activity(title: "Kickboxing", subtitle: "This week", image: "figure.kickboxing", tintColor: .green, amount: "25 minutes"),
    ]
    
    init() {
        
    }
}
