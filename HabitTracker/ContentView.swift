//
//  ContentView.swift
//  HabitTracker
//
//  Created by Yassine on 4/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State var showSignUp: Bool = false
    var body: some View {
        if showSignUp {
            SignUpView(showSignUp: $showSignUp)
        } else {
            LoginView(showSignUp: $showSignUp)
        }
    }
}

#Preview {
    ContentView()
}
