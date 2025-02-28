//
//  File.swift
//  FF
//
//  Created by Andrii Marchuk on 22.02.2025.
//

import UIKit
import SwiftUI

class PreviewViewController: UIViewController {

   var previewView = PreviewView()

   override func viewDidLoad() {
      super.viewDidLoad()

      previewView.setupHostingController(self)
   }
}

// MARK: View

struct PreviewView: View {
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
                  LinkLabel(title: "Sign up",
                            titleColor: Colors.whiteColor,
                            backgroundColor: .clear)
               }

               NavigationLink {
                  LogInView()
               } label: {
                  LinkLabel(title: "Log in",
                            titleColor: Colors.primaryColor,
                            backgroundColor: Colors.whiteColor)
               }
            }
         }
         .padding(12)

         .background(Colors.primaryColor)
      }
   }
}

struct LoginTextField: View {
   let text: Binding<String>

   var body: some View {
      TextField("", text: text, prompt: Text("Phone, email, or username").foregroundColor(Colors.grayColor))
         .multilineTextAlignment(.center)
         .foregroundStyle(Colors.primaryColor)
         .tint(Colors.primaryColor)
         .font(Fonts.boldPrimaryFont)
         .padding()
         .background {
            RoundedRectangle(cornerRadius: 16)
               .fill(Colors.whiteColor)
               .frame(height: 48)
         }
   }
}

struct PasswordSecureField: View {
   let text: Binding<String>

   var body: some View {
      SecureField("", text: text, prompt: Text("Password").foregroundColor(Colors.grayColor))
         .multilineTextAlignment(.center)
         .foregroundStyle(Colors.primaryColor)
         .tint(Colors.primaryColor)
         .font(Fonts.boldPrimaryFont)
         .padding()
         .background {
            RoundedRectangle(cornerRadius: 16)
               .fill(Colors.whiteColor)
               .frame(height: 48)
         }
   }
}

struct MainButton: View {
   let title: String
   let titleColor: Color
   let backgroundColor: Color
   let action: () -> Void

   var body: some View {
      Button {
         action()
      } label: {
         ZStack {
            RoundedRectangle(cornerRadius: 16)
               .fill(backgroundColor)
               .frame(height: 48)
            Text(title)
               .font(Fonts.boldPrimaryFont)
               .foregroundStyle(titleColor)
               .bold()
         }
      }
   }
}

struct LinkLabel: View {
   let title: String
   let titleColor: Color
   let backgroundColor: Color

   var body: some View {
      ZStack {
         RoundedRectangle(cornerRadius: 16)
            .fill(backgroundColor)
            .frame(height: 48)
         Text(title)
            .font(Fonts.boldPrimaryFont)
            .foregroundStyle(titleColor)
            .bold()
      }
   }
}

struct TitleText: View {
   let title: String
   let alignment: TextAlignment

   var body: some View {
      Text(title)
         .multilineTextAlignment(alignment)
         .foregroundStyle(Colors.whiteColor)
         .font(Fonts.titleFont)
         .bold()
   }
}

struct SubtitleText: View {
   let subtitle: String

   var body: some View {
      Text(subtitle)
         .multilineTextAlignment(.leading)
         .foregroundStyle(Colors.whiteColor)
         .font(Fonts.primaryFont)
   }
}

struct ToolBarFrame: View {
   var image: String

   var body: some View {
         ZStack {
            RoundedRectangle(cornerRadius: 12)
               .fill(Colors.whiteColor)
               .frame(width: 36, height: 36)
            Image(image)
               .resizable()
               .frame(width: 24, height: 24)
               .tint(Colors.primaryColor)
      }
   }
}

#Preview {
   PreviewView()
      .background(Colors.primaryColor)
}


