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
         VStack(alignment: .leading, spacing: 12) {
            TitleText(title: "Welcome back.",
                      alignment: .leading)

            SubtitleText(subtitle: "Please enter your email & password to log in.")
         }

         Spacer()

         // Input Fields
         VStack(spacing: 12) {
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
            viewModel.signIn()
         } label: {
            MainButtonFrame(title: "Start",
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
   LogInView()
}

