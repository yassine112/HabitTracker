//
//  DayView.swift
//  HabitTracker
//
//  Created by Yassine on 4/11/2024.
//

import SwiftUI

struct DayView: View {
    var dayName: String
    var day: String
    
    var body: some View {
        VStack(spacing: 2.0) {
            Text(dayName)
                .fontWeight(.semibold)
                .font(.caption)
                .foregroundStyle(.secondaryText)
            ZStack {
                RoundedRectangle(cornerRadius: 8.0)
                    .fill(.gray.opacity(0.1))
                    .foregroundStyle(.mint.opacity(0.3))
                    .frame(width: 32, height: 32)
                Text(day)
                    .foregroundStyle(.secondaryText)
                    .fontWeight(.semibold)
                    .font(.caption)
            }
        }
    }
}

#Preview {
    DayView(dayName: "Mon", day: "7")
}
