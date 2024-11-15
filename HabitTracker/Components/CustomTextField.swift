//
//  CustomTextField.swift
//  HabitTracker
//
//  Created by Yassine on 4/11/2024.
//

import SwiftUI

struct CustomTextField: View {
    
    let placeholder: String
    @Binding var text: String
    @FocusState var isTyping: Bool
    
    /* Secure text entry */
    var isSecure: Bool = false
    @State private var isTextHidden = true
    
    var body: some View {
        ZStack(alignment: .leading) {
            if isSecure && isTextHidden {
                SecureField("", text: $text)
                    .padding(.leading)
                    .frame(height: 55)
                    .focused($isTyping)
                    .background(isTyping ? .powderBlue : .primaryText, in: RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
            } else {
                TextField("", text: $text)
                    .padding(.leading)
                    .frame(height: 55)
                    .focused($isTyping)
                    .background(isTyping ? .powderBlue : .primaryText, in: RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
            }
            
            Text(placeholder).padding(.horizontal, 5)
                .background(.background.opacity(isTyping || !text.isEmpty ? 1 : 0))
                .foregroundStyle(isTyping ? .powderBlue : .primaryText)
                .padding(.leading).offset(y: isTyping || !text.isEmpty ? -27 : 0)
                .onTapGesture {
                    isTyping.toggle()
                }
            
            // Toggle Button to show/hide secure text
            if isSecure {
                Button(action: {
                    isTextHidden.toggle()
                }) {
                    Image(systemName: isTextHidden ? "eye.slash" : "eye")
                        .foregroundColor(isTyping ? .powderBlue : .primaryText)
                }
                .padding(.trailing)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
        }
        .animation(.linear(duration: 0.1), value: isTyping)
    }
}

#Preview {
    @Previewable @State var text: String = ""
    CustomTextField(placeholder: "Full name", text: $text, isSecure: true)
}
