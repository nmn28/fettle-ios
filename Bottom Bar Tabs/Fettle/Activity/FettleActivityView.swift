//
//  FettleAcvitivyView.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/6/24.
//

import SwiftUI

struct FettleActivityView: View {
//    let onSwipe: (FettleSwipeDirection) -> Void
    @EnvironmentObject var manager: HealthManager
    let welcomeArray = ["Welcome", "Bienvenido", "Bienvenue"]
    @State private var currentIndex = 0
    @State private var selectedOption = 0
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
//                Text(welcomeArray[currentIndex])
//                    .font(.largeTitle)
//                    .padding()
//                    .foregroundColor(.secondary)
//                    .animation(.easeInOut(duration: 1), value: currentIndex)
//                    .onAppear {
//                        startWelcomeTimer()
//                    }
//
                Picker("Select an option", selection: $selectedOption) {
                                Text("Overview").tag(0)
                                Text("Sleep").tag(1)
                                Text("Recovery").tag(2)
                                Text("Strain").tag(3)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding()
                
                Text("Today")
                    .padding(.horizontal)
                    .font(.title2)
                HStack {
                    Spacer()
                    
                    VStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Calories")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.red)
                            
                            Text("\(manager.calories) kcal")
                                .bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Active")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.green)
                            
                            Text("\(manager.exercise) mins")
                                .bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Stand")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.blue)
                            
                            Text("\(manager.stand) hours")
                                .bold()
                        }
                    }
                    
                    Spacer()
                    
                    ZStack {
                        HealthProgressCircle(progress: $manager.calories, goal: 1000, color: .red)
                            .frame(width: 200, height: 200)
                        
                        HealthProgressCircle(progress: $manager.exercise, goal: 60, color: .green)
                            .frame(width: 160, height: 160)
                        
                        HealthProgressCircle(progress: $manager.stand, goal: 12, color: .blue)
                            .frame(width: 120, height: 120)
                    }
                    Spacer()
                }
                .padding(.vertical)
                
                HStack {
                    Text("Current Device: Fettle Ring")
                        .padding(.horizontal)
                    Image("ring")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Spacer()
                    
                    Button {
                        MarketplaceView()
                    } label: {
                        Text("Shop Wearables")
                            .padding(.all, 10)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(20)
                            .font(.caption)
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
                
                HStack {
                    Text("Fitness Activity")
                        .font(.title2)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("More")
                            .padding(.all, 10)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(20)
                            .font(.subheadline)
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                    ForEach(manager.mockActivities.prefix(6)) { activity in
                        ActivityCard(activity: activity)
                        
                    }
                }
                .padding(.horizontal)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
    
    func startWelcomeTimer() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % welcomeArray.count
            }
        }
    }
}
#Preview {
    FettleActivityView()
        .environmentObject(HealthManager())
}
