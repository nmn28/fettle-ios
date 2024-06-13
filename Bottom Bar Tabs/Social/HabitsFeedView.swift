//
//  HabitsFeedView.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/12/24.
//

import SwiftUI

struct HabitsFeedView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            HStack {
                Image("placeholder/user")
                    .resizable()
                    .frame(width: 40, height: 40)
                Image(systemName: "bed.double")
                Text("Nick slept 7.5 hours.")
                HStack (spacing: 2) {
                    Image(systemName: "plus")
                    Text("100 pts")
                }
                .font(.caption)
                .foregroundColor(.green)
            }
            CardFooterView()
            Divider()
            HStack {
                Image(.pic)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                Image(systemName: "figure.run")
                Text("Jill ran 2 miles. See route")
                HStack (spacing: 2) {
                    Image(systemName: "plus")
                    Text("200 pts")
                }
                .font(.caption)
                .foregroundColor(.green)
            }
            CardFooterView()
            Divider()
            HStack {
                Image("placeholder/user")
                    .resizable()
                    .frame(width: 40, height: 40)
                Image(systemName: "drop")
                Text("Bob registered a blood test. Results were poor.")
                HStack (spacing: 2) {
                    Image(systemName: "minus")
                    Text("80 pts")
                }
                .font(.caption)
                .foregroundColor(.red)
            }
            CardFooterView()
            Divider()
            HStack {
                Image(.pic)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                Image(systemName: "wineglass")
                Text("Barbara had a long night out.")
                HStack (spacing: 2) {
                    Image(systemName: "minus")
                    Text("145 pts")
                }
                .font(.caption)
                .foregroundColor(.red)
            }
            CardFooterView()
            Divider()
            
            HStack {
                Image("placeholder/user")
                    .resizable()
                    .frame(width: 40, height: 40)
                Image(systemName: "syringe")
                Text("Nick just got immunotherapy shot.")
                HStack (spacing: 2) {
                    Image(systemName: "plus")
                    Text("145 pts")
                }
                .font(.caption)
                .foregroundColor(.green)
            }
            CardFooterView()
            Divider()
        }
        .padding()
    }
}

#Preview {
    HabitsFeedView()
}
