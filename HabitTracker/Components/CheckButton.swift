//
//  CheckButton.swift
//  HabitTracker
//
//  Created by Yassine on 4/11/2024.
//

import SwiftUI

struct CheckButton: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .tint(configuration.isOn ? .powderBlue : .primaryText)
                configuration.label
            }
        }
    }
}

#Preview {
    Toggle("Check", isOn: .constant(true))
        .tint(.primaryText)
        .toggleStyle(CheckButton())
}
