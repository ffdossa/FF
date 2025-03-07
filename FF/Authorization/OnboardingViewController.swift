//
//  File.swift
//  FF
//
//  Created by Andrii Marchuk on 22.02.2025.
//

import UIKit
import SwiftUI

class OnboardingViewController: UIViewController {

   var previewView = OnboardingView()

   override func viewDidLoad() {
      super.viewDidLoad()

      previewView.setupHostingController(self)
   }
}

// MARK: View

struct OnboardingView: View {
   var body: some View {
      NavigationView {
         VStack {
            TitleText(title: "Welcome\nto\nFF app",
                      alignment: .center)
            Spacer()

            VStack(spacing: 12) {
               NavigationLink {
                  SignUpView()
               } label: {
                  MainButtonFrame(title: "Sign up",
                            titleColor: Colors.whiteColor,
                            backgroundColor: .clear)
               }

               NavigationLink {
                  LogInView()
               } label: {
                  MainButtonFrame(title: "Log in",
                            titleColor: Colors.darkBlackColor,
                            backgroundColor: Colors.whiteColor)
               }
            }
         }
         .padding()

         .background(Colors.darkBlackColor)
      }
   }
}

#Preview {
   OnboardingView()
      .background(Colors.darkBlackColor)
}


