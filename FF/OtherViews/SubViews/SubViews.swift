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
         .font(Fonts.basicRegularFont)
         .padding()
         .background {
            RoundedRectangle(cornerRadius: 18)
               .fill(Colors.whiteColor.opacity(0.1))
               .frame(height: 45)
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
         .font(Fonts.basicRegularFont)
         .padding()
         .background {
            RoundedRectangle(cornerRadius: 18)
               .fill(Colors.whiteColor.opacity(0.1))
               .frame(height: 45)
         }
   }
}

struct MainButtonFrame: View {
   let title: String
   let titleColor: Color
   let backgroundColor: Color

   var body: some View {
      ZStack {
         RoundedRectangle(cornerRadius: 18)
            .fill(backgroundColor)
            .frame(height: 45)
         Text(title)
            .font(Fonts.hashMediumFont)
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
         RoundedRectangle(cornerRadius: 12)
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
         RoundedRectangle(cornerRadius: 12)
            .fill(Colors.random())
            .frame(width: 30, height: 30)
         Text(text)
            .font(Fonts.countSemiboldFont)
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
         .foregroundStyle(Colors.socialWhiteColor)
   }
}

struct TitleSubtitleTextFrame: View {
   var titleText: String
   var subText: String

   var body: some View {
      VStack(alignment: .leading, spacing: 4) {
         Text(titleText)
            .font(Fonts.hashMediumFont)
            .foregroundStyle(Colors.whiteColor)

         Text(subText)
            .font(Fonts.basicRegularFont)
            .foregroundStyle(Colors.lighterGrayWhite)
      }
   }
}

struct PushButtonFrame: View {
   var image: String

   var body: some View {
      ZStack {
         RoundedRectangle(cornerRadius: 16)
            .fill(Colors.whiteColor)
            .frame(width: 40, height: 40)

         Image(image)
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundStyle(Colors.darkBlackColor)
      }
   }
}

struct ProfileImageFrame: View {
   var text: String

   var body: some View {
      ZStack {
         RoundedRectangle(cornerRadius: 16)
            .fill(Colors.random())
            .frame(width: 40, height: 40)

         Text(text)
            .font(Fonts.titleRegularFont)
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
            .foregroundStyle(Colors.lighterGrayWhite)

         Text(text)
            .font(Fonts.countRegularFont)
            .foregroundStyle(Colors.lighterGrayWhite)
            .padding(.leading, -4)
      }
   }
}

struct ButtonTextFrame: View {
   var text: String

   var body: some View {
      Text(text)
         .font(Fonts.hashMediumFont)
         .foregroundStyle(Colors.lighterGrayWhite)


   }
}

struct PostButtonImage: View {
   var image: String

   var body: some View {
      Image(image)
         .resizable()
         .frame(width: 16, height: 16)
         .foregroundStyle(Colors.lighterGrayWhite)
   }
}
