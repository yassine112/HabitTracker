//
//  PrimaryButton.swift
//  HabitTracker
//
//  Created by Yassine on 4/11/2024.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.ultraThickMaterial)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(.primaryText, in: RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    PrimaryButton(title: "Hello, World!", action: {})
        .padding()
}
