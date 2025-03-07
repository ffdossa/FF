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

         // HERE PLASE FOR LOGIN GOOGLE, APPLE MAIL

         // Input Fields
         VStack(spacing: 8) {
            LoginTextField(text: $viewModel.login)

            PasswordSecureField(text: $viewModel.password)
         }

         // Error Message
         if let error = viewModel.error {
            Text(error)
               .foregroundStyle(Colors.whiteColor)
               .font(Fonts.basicRegularFont)
               .padding(.vertical, 8)
         }

         Spacer()

         // Sign-Up Button
         Button {
            viewModel.createUser()
         } label: {
            MainButtonFrame(title: "Create account",
                            titleColor: Colors.darkBlackColor,
                            backgroundColor: Colors.whiteColor)
         }
         .disabled(!viewModel.isAuthFormValidate)
      }
      .padding()

      .background(Colors.darkBlackColor)

      .toolbar {
         ToolbarItem(placement: .topBarLeading) {
            Button {
               presentationMode.wrappedValue.dismiss()
            } label: {
               ToolbarButtonFrame(image: "close")
            }
         }
      }
      .navigationBarBackButtonHidden(true)
   }
}

#Preview {
   SignUpView()
      .background(Colors.darkBlackColor)
}
