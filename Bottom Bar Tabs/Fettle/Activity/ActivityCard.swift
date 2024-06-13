//
//  ActivityCard.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/6/24.
//

import SwiftUI

struct Activity: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let image: String
    let tintColor: Color
    let amount: String
}

struct ActivityCard: View {
    @State var activity: Activity
    
    var body: some View {
      
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(activity.title)
                            .font(.system(size: 16))
                        
                        Text(activity.subtitle)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: activity.image)
                        .foregroundColor(activity.tintColor)
                }
                
                
                Text(activity.amount)
                    .font(.system(size: 24))
                    .minimumScaleFactor(0.6)
                    .bold()
                    .padding(.bottom)
            }
            .padding()
        }
        
    }
}

struct ActivityCard_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCard(activity: Activity(title: "Daily steps", subtitle: "Goal: 10,000", image: "figure.walk", tintColor: .green, amount: "6,545"))
    }
}
