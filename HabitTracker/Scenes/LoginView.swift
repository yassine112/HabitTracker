//
//  LoginView.swift
//  HabitTracker
//
//  Created by Yassine on 4/11/2024.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var isRememberOn: Bool = false
    @Binding var showSignUp: Bool
    
    var body: some View {
        ZStack {
            Color(.background).ignoresSafeArea()
            VStack(spacing: 42) {

                TopView(title: "Habit Tracker", subtitle: "Please sign up to start tracking your habits")
                    
                VStack(spacing: 20) {
                    CustomTextField(placeholder: "Email", text: $email)
                    CustomTextField(placeholder: "Password", text:  $password, isSecure: true)
                    HStack {
                        Toggle(isOn: $isRememberOn) {
                            Text("Remember me")
                        }.toggleStyle(CheckButton())
                        Spacer()
                        Button(action: {}) {
                            Text("Forget Password ?")
                        }
                    }.tint(.primaryText)
                    
                    PrimaryButton(title: "Sign In", action: {})
                    
                    orView

                    HStack(spacing: 32) {
                        LabellessButton(icon: .facebook, action: {})
                        LabellessButton(icon: .gmail, action: {})
                        LabellessButton(icon: .twitter, action: {})
                    }

                    Button(action: {
                        withAnimation {
                            showSignUp.toggle()
                        }
                    }) {
                        Text("I don't have an account. **Sign Up**")
                            .tint(.primaryText)
                    }
                }
            }.padding()
        }
    }
    
    let orView: some View = ZStack {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 1)
        Text("Or")
            .padding(.horizontal, 16)
            .background(.background.opacity(1))
    }.foregroundStyle(.primaryText)
}



struct TopView: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title.bold())
            Text(subtitle)
                .foregroundStyle(.secondaryText)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    LoginView(showSignUp: .constant(false))
}


