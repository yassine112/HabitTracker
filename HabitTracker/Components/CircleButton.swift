//
//  CircleButton.swift
//  HabitTracker
//
//  Created by Yassine on 4/11/2024.
//

import SwiftUI

struct CircleButton: View {
    var icon: String
    var action: () -> Void
    
    var body: some View {
        
        Button(action: action, label: {
            ZStack {
                Circle()
                    .fill(.card)
                Image(systemName: icon)
                    .foregroundStyle(.primaryText)
            }
        }).frame(width: 25)
    }
}

#Preview {
    CircleButton(icon: "chevron.right") {}
}
