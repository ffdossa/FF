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
      TextField("", text: text, prompt: Text("Phone, email, or username").foregroundColor(Colors.lighterGrayWhite))
         .multilineTextAlignment(.center)
         .foregroundStyle(Colors.whiteColor)
         .tint(Colors.whiteColor)
         .font(Fonts.regularFont)
         .padding(.vertical, 12)
         .padding(.horizontal, 16)
         .background {
            RoundedRectangle(cornerRadius: 24)
               .fill(Colors.whiteColor.opacity(0.1))
         }
   }
}

struct PasswordSecureField: View {
   let text: Binding<String>

   var body: some View {
      SecureField("", text: text, prompt: Text("Password").foregroundColor(Colors.lighterGrayWhite))
         .multilineTextAlignment(.center)
         .foregroundStyle(Colors.whiteColor)
         .tint(Colors.whiteColor)
         .font(Fonts.regularFont)
         .padding(.vertical, 12)
         .padding(.horizontal, 16)
         .background {
            RoundedRectangle(cornerRadius: 24)
               .fill(Colors.whiteColor.opacity(0.1))
         }
   }
}

struct MainButtonFrame: View {
   let title: String
   let titleColor: Color
   let backgroundColor: Color

   var body: some View {
      ZStack {
         RoundedRectangle(cornerRadius: 24)
            .fill(backgroundColor)
            .frame(height: 48)

         Text(title)
            .font(Fonts.subtitleMediumFont)
            .foregroundStyle(titleColor)
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
   }
}

struct SubtitleText: View {
   let subtitle: String

   var body: some View {
      Text(subtitle)
         .multilineTextAlignment(.leading)
         .foregroundStyle(Colors.whiteColor)
         .font(Fonts.basicRegularFont)
   }
}

struct ToolbarButtonFrame: View {
   var image: String

   var body: some View {
      ZStack {
         Circle()
            .fill(.black.opacity(0.4))
            .frame(width: 30, height: 30)
         Image(image)
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundStyle(Colors.whiteColor)
      }
   }
}

struct ProfileToolbarButtonFrame: View {
   var image: String

   var body: some View {
      ZStack {
         Circle()
            .fill(.black.opacity(0.4))
            .frame(width: 30, height: 30)
         Image(image)
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundStyle(Colors.random())
      }
   }
}

struct PushButtonFrame: View {
   var image: String

   var body: some View {
      ZStack {
         Circle()
            .fill(Colors.whiteColor)
            .frame(width: 48, height: 48)

         Image(image)
            .resizable()
            .frame(width: 36, height: 36)
            .foregroundStyle(Colors.darkBlackColor)
      }
   }
}

struct ProfileImageFrame: View {
   var image: String

   var body: some View {
      ZStack {
         Circle()
            .fill(Color.black.opacity(0.4))
            .frame(width: 42, height: 42)

         Image(image)
            .resizable()
            .frame(width: 28, height: 28)
            .foregroundStyle(Colors.whiteColor)
      }
   }
}

struct FollowFrame: View {
   var countText: String
   var text: String

   var body: some View {
      VStack(alignment: .leading, spacing: 2) {
         Text(countText)
            .font(Fonts.countMediumFont)
            .foregroundStyle(Colors.whiteColor)

         Text(text)
            .font(Fonts.countRegularFont)
            .foregroundStyle(Colors.lighterGrayWhite)
      }
   }
}

struct BottomTextFrame: View {
   var text: String

   var body: some View {
      Text(text)
         .font(Fonts.countRegularFont)
         .foregroundStyle(Colors.lighterGrayWhite)
         .padding(.leading, -4)
   }
}

struct BottomPostImage: View {
   var image: String

   var body: some View {
      Image(image)
         .resizable()
         .frame(width: 16, height: 16)
         .foregroundStyle(Colors.lighterGrayWhite)
   }
}
