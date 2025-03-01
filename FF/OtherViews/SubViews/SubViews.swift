//
//  SubViews.swift
//  FF
//
//  Created by Andrii Marchuk on 01.03.2025.
//

import SwiftUI

struct LoginTextField: View {
   let text: Binding<String>

   var body: some View {
      TextField("", text: text, prompt: Text("Phone, email, or username").foregroundColor(Colors.grayColor))
         .multilineTextAlignment(.center)
         .foregroundStyle(Colors.whiteColor)
         .tint(Colors.whiteColor)
         .font(Fonts.primaryFont)
         .padding()
         .background {
            RoundedRectangle(cornerRadius: 16)
               .fill(Colors.secondaryColor)
               .opacity(0.1)
               .frame(height: 48)
         }
   }
}

struct PasswordSecureField: View {
   let text: Binding<String>

   var body: some View {
      SecureField("", text: text, prompt: Text("Password").foregroundColor(Colors.grayColor))
         .multilineTextAlignment(.center)
         .foregroundStyle(Colors.whiteColor)
         .tint(Colors.whiteColor)
         .font(Fonts.primaryFont)
         .padding()
         .background {
            RoundedRectangle(cornerRadius: 16)
               .fill(Colors.secondaryColor)
               .opacity(0.1)
               .frame(height: 48)
         }
   }
}

struct MainButtonFrame: View {
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

struct ToolbarButtonFrame: View {
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

struct PrimaryText: View {
   var text: String

   var body: some View {
      Text(text)
         .multilineTextAlignment(.leading)
         .font(Fonts.primaryFont)
         .foregroundStyle(Colors.whiteColor)
   }
}

struct TitleSubtitleTextFrame: View {
   var titleText: String
   var subText: String

   var body: some View {
      Text(titleText)
         .font(Fonts.primaryFont)
         .bold()
         .foregroundStyle(Colors.whiteColor)

      Text(subText)
         .font(Fonts.primaryFont)
         .foregroundStyle(Colors.grayColor)
   }
}

struct ButtonImageFrame: View {
   var image: String

   var body: some View {
      ZStack {
         RoundedRectangle(cornerRadius: 16)
            .fill(Colors.whiteColor)
            .frame(width: 48, height: 48)
         Image(image)
            .resizable()
            .frame(width: 32, height: 32)
            .tint(Colors.primaryColor)
      }
   }
}

struct PostButtonTextImageFrame: View {
   var image: String
   var text: String

   var body: some View {
      HStack {
         Image(image)
            .resizable()
            .frame(width: 16, height: 16)
            .tint(Colors.grayColor)

         Text(text)
            .font(Fonts.lightFont)
            .foregroundStyle(Colors.grayColor)
            .padding(.leading, -4)
      }
   }
}

struct PostButtonImage: View {
   var image: String

   var body: some View {
      Image(image)
         .resizable()
         .frame(width: 16, height: 16)
         .tint(Colors.grayColor)
   }
}
