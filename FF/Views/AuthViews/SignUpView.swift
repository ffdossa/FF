//
//  SignUpView.swift
//  FF
//
//  Created by Andrii Marchuk on 22.02.2025.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = AuthViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            // Header
            VStack(alignment: .leading, spacing: 16) {
                TitleText(title: "Hello there.",
                          alignment: .leading)

                SubtitleText(subtitle: "Please enter your email & password to create an account.")
            }

            Spacer()

            // Input Fields
            VStack(spacing: 8) {
                LoginTextField(text: $viewModel.login)

                PasswordSecureField(text: $viewModel.password)
            }

            // Error Message
            if let error = viewModel.error {
                           Text(error)
                               .foregroundStyle(.red)
                               .font(.caption)
                               .padding(.vertical, 8)
                       }

            Spacer()
            
            // Sign-Up Button
            MainButton(title: "Create account",
                       titleColor: Colors.basicColor,
                       backgroundColor: Colors.whiteColor) {
                viewModel.createUser()
            }
                       .disabled(!viewModel.isAuthFormValidate)
        }
        .padding()

        .background(Colors.basicColor)

        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                ToolBarButton(image: Image(systemName: "xmark")) {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignUpView()
        .background(Colors.basicColor)
}
