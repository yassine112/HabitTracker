//
//  LabellessButton.swift
//  HabitTracker
//
//  Created by Yassine on 12/11/2024.
//

import SwiftUI

struct LabellessButton: View {
    var icon: ImageResource
    var action: () -> Void
    var width: Double
    var height: Double
    
    init(icon: ImageResource, width: Double = 50, height: Double = 50 ,action: @escaping () -> Void) {
        self.icon = icon
        self.action = action
        self.width = width
        self.height = height
    }
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.primaryText)
                    .frame(width: width, height: height)
                Image(icon)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundStyle(Color.background)
            }
        }
    }
}
