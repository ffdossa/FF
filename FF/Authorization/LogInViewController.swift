//
//  File.swift
//  FF
//
//  Created by Andrii Marchuk on 22.02.2025.
//

import UIKit
import SwiftUI

class LogInViewController: UIViewController {

   var loginView = LogInView()

   override func viewDidLoad() {
      super.viewDidLoad()

      loginView.setupHostingController(self)
   }
}

// MARK: View

struct LogInView: View {
   @Environment(\.presentationMode) var presentationMode
   @ObservedObject var viewModel = AuthViewModel()

   var body: some View {
      VStack(alignment: .leading) {
         // Header
         VStack(alignment: .leading, spacing: 16) {
            TitleText(title: "Welcome back.",
                      alignment: .leading)

            SubtitleText(subtitle: "Please enter your email & password to log in.")
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
         MainButton(title: "Start",
                    titleColor: Colors.primaryColor,
                    backgroundColor: Colors.whiteColor) {
            viewModel.signIn()
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
   LogInView()
      .background(Colors.primaryColor)
}

