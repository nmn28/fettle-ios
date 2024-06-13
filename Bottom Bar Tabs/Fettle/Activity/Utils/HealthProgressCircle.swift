//
//  HealthProgressCircle.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/6/24.
//

import SwiftUI

struct HealthProgressCircle: View {
    @Binding var progress: Int
    var goal: Int
    var color: Color
    private let width: CGFloat = 20
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.2), lineWidth: width)
            
            Circle()
                .trim(from: 0, to: (CGFloat(progress) / CGFloat(goal)))
                .stroke(LinearGradient(gradient: Gradient(colors: [color, color.opacity(0.8)]), startPoint: .topTrailing, endPoint: .bottomLeading), style: StrokeStyle(lineWidth: width, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .shadow(color: .black, radius: 5)
        
        }
    }
}

struct ProgressCircle_Previews: PreviewProvider {
    static var previews: some View {
        HealthProgressCircle(progress: .constant(140), goal: 200, color: .red)
    }
}

