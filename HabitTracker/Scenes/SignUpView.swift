//
//  SignUpView.swift
//  HabitTracker
//
//  Created by Yassine on 5/11/2024.
//

import SwiftUI

struct SignUpView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    @Binding var showSignUp: Bool
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack(spacing: 42) {
                TopView(title: "Habit Tracker", subtitle: "Take the first step toward a consistent routine. sign up to make habit tracking simple and fun.")
                
                VStack(spacing: 20) {
                    
                    CustomTextField(placeholder: "User Name", text: $username)
                    CustomTextField(placeholder: "Email", text: $email)
                    CustomTextField(placeholder: "Password", text: $password)
                    CustomTextField(placeholder: "Confirm Password", text: $confirmPassword)
                    
                    PrimaryButton(title: "Sign In", action: {})
                    Button(action: {
                        withAnimation {
                            showSignUp.toggle()
                        }
                    }) {
                        Text("I already have an account. **Sign In**")
                            .tint(.primaryText)
                    }
                }
            }.padding()
        }
    }
}

#Preview {
    SignUpView(showSignUp: .constant(false))
}
