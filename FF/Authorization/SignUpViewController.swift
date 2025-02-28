//
//  File.swift
//  FF
//
//  Created by Andrii Marchuk on 22.02.2025.
//

import UIKit
import SwiftUI

class SignUpViewController: UIViewController {

   var signupView = SignUpView()

   override func viewDidLoad() {
      super.viewDidLoad()

      signupView.setupHostingController(self)
   }
}

// MARK: View

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
               .foregroundStyle(Colors.whiteColor)
               .font(Fonts.primaryFont)
               .padding(.vertical, 8)
         }

         Spacer()

         // Sign-Up Button
         MainButton(title: "Create account",
                    titleColor: Colors.primaryColor,
                    backgroundColor: Colors.whiteColor) {
            viewModel.createUser()
         }
                    .disabled(!viewModel.isAuthFormValidate)
      }
      .padding(12)

      .background(Colors.primaryColor)

      .toolbar {
         ToolbarItem(placement: .topBarLeading) {
            Button {
               presentationMode.wrappedValue.dismiss()
            } label: {
               ToolBarFrame(image: "close")
            }
         }
      }
      .navigationBarBackButtonHidden(true)
   }
}

#Preview {
   SignUpView()
      .background(Colors.primaryColor)
}
