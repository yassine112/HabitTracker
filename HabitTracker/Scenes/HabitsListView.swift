//
//  HabitsListView.swift
//  HabitTracker
//
//  Created by Yassine on 4/11/2024.
//

import SwiftUI

struct HabitsListView: View {
    let data: [Int] // = Array(1...7)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.background).ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(1...8, id: \.self) { _ in
                            HabitCard(weakDays: data)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle("Your habits")
        }
    }
}

#Preview {
    HabitsListView(data: Array(1...7))
}
