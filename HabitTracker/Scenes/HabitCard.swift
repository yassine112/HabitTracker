//
//  HabitCard.swift
//  HabitTracker
//
//  Created by Yassine on 4/11/2024.
//

import SwiftUI

struct HabitCard: View {
    
    var weakDays: Array<Int>
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 4){
                    Text("Read a book")
                    Text("Every day")
                        .font(.caption)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 4)
                        .foregroundStyle(.red)
                        .background(.red.opacity(0.2))
                        .cornerRadius(4)
                }
                Spacer()
                Image(systemName: "trash.square.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.delete)
            }
            
            HStack {
                ForEach(weakDays, id: \.self) { item in
                    dayView(item)
                }
            }
            .padding(.horizontal)
        }
        .padding()
        .background(.card)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .shadow.opacity(0.3), radius: 15, y: 10)
    }
    
    @ViewBuilder
    fileprivate func dayView(_ item: Int) -> some View {
        VStack(spacing: 2) {
            Text("Mon")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.secondaryText)
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.gray.opacity(0.1))
                    .frame(width: 32, height: 32)
                Text("\(item)")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondaryText)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    HabitCard(weakDays: Array(1...7))
}
