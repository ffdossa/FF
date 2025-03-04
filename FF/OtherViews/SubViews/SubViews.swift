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
         .font(Fonts.basicRegularFont)
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
         .font(Fonts.basicRegularFont)
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
            .font(Fonts.secondBoldFont)
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
         RoundedRectangle(cornerRadius: 10)
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
   var text: String

   var body: some View {
      ZStack {
         RoundedRectangle(cornerRadius: 10)
            .fill(Colors.random())
            .frame(width: 30, height: 30)
         Text(text)
            .font(Fonts.secondMediumFont)
            .foregroundStyle(Colors.whiteColor)
      }
   }
}

struct PrimaryText: View {
   var text: String

   var body: some View {
      Text(text)
         .multilineTextAlignment(.leading)
         .font(Fonts.basicRegularFont)
         .foregroundStyle(Colors.whiteColor)
   }
}

struct TitleSubtitleTextFrame: View {
   var titleText: String
   var subText: String

   var body: some View {
      Text(titleText)
         .font(Fonts.basicRegularFont)
         .foregroundStyle(Colors.whiteColor)

      Text(subText)
         .font(Fonts.basicRegularFont)
         .foregroundStyle(Colors.grayColor)
   }
}

struct PushButtonFrame: View {
   var image: String

   var body: some View {
      ZStack {
         RoundedRectangle(cornerRadius: 14)
            .fill(Colors.secondaryColor)
            .frame(width: 42, height: 42)

         Image(image)
            .resizable()
            .frame(width: 28, height: 28)
            .foregroundStyle(Colors.whiteColor)
      }
   }
}

struct ProfileImageFrame: View {
   var text: String

   var body: some View {
      ZStack {
         RoundedRectangle(cornerRadius: 14)
            .fill(Colors.random())
            .frame(width: 42, height: 42)

         Text(text)
            .font(Fonts.secondBoldFont)
            .foregroundStyle(Colors.whiteColor)
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
            .foregroundStyle(Colors.grayColor)

         Text(text)
            .font(Fonts.secondRegularFont)
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
         .foregroundStyle(Colors.grayColor)
   }
}
