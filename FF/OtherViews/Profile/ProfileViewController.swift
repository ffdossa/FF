//
//  ProfileViewController.swift
//  FF
//
//  Created by Andrii Marchuk on 26.02.2025.
//

import UIKit
import SwiftUI

class ProfileViewController: UIViewController {

   var profileView = SettingsView()

   override func viewDidLoad() {
      super.viewDidLoad()

      profileView.setupHostingController(self)
   }
}

// MARK: View

struct ProfileView: View {
   @Environment(\.presentationMode) var presentationMode
   @StateObject var viewModel = HomeViewModel(userId: "")

   var body: some View {
      NavigationView {
         VStack(alignment: .leading, spacing: 12) {
            ZStack(alignment: .bottomLeading) {
//               Rectangle()
//                  .frame(height: 144)
//                  .foregroundStyle(Colors.secondaryDarkColor)

//               ZStack {
//                  RoundedRectangle(cornerRadius: 24)
//                     .fill(Colors.whiteColor)
//                     .frame(width: 72, height: 72)
//
//
//                  Image("profile")
//                     .resizable()
//                     .frame(width: 48, height: 48)
//               }

//               .padding(.leading, 12)
            }


            VStack(alignment: .leading) {
               Text("FFDOSSA")
                  .font(.title2)
                  .foregroundStyle(Colors.whiteColor)
                  .bold()

               Text("@ffdossa")
                  .font(Fonts.primaryFont)
                  .foregroundStyle(Colors.grayColor)

               TextPrimaryFrame(text: "BREAKING: Romanian prosecutors found 10 million $ in cash burried in an underground safe at the house of Calin Georgescu's bodyguard.")

               HStack(alignment: .top, spacing: 12) {
                  TextImageFrame(image: "work", text: "iOS Developer")


                  TextImageFrame(image: "location", text: "Ukraine")

                  Link(destination: URL(string: "https://github.com/ffdossa")!) {
                     TextImageFrame(image: "link", text: "link")
                  }

                  TextImageFrame(image: "calendar", text: "Text When Joined")
               }

               HStack {
                  Button {
                     // FOLLOWING BUTTON
                  } label: {
                     Text("11k")
                        .font(Fonts.lightFont)
                        .bold()
                        .foregroundStyle(Colors.whiteColor)

                     Text("Following")
                        .font(Fonts.lightFont)
                        .foregroundStyle(Colors.grayColor)
                        .padding(.leading, -4)
                  }

                  Button {
                     // FOLLOWERS BUTTON
                  } label: {
                     Text("22k")
                        .font(Fonts.lightFont)
                        .bold()
                        .foregroundStyle(Colors.whiteColor)

                     Text("Followers")
                        .font(Fonts.lightFont)
                        .foregroundStyle(Colors.grayColor)
                        .padding(.leading, -4)
                  }
               }

               Divider()

               ZStack(alignment: .bottomTrailing) {
                  PostScrollView()

                  Button {
                     viewModel.showingNewItemView = true
                  } label: {
                     ImageButtonFrame(image: "add")
                  }
               }
            }
            .padding(12)

         }

         .background(Colors.primaryColor)

         .toolbar {
            ToolbarItem(placement: .topBarLeading) {
               Button {
                  presentationMode.wrappedValue.dismiss()
               } label: {
                  ToolBarFrame(image: "close")
               }
            }

            ToolbarItem(placement: .topBarTrailing) {
               Button {
                  presentationMode.wrappedValue.dismiss()
               } label: {
                  ToolBarFrame(image: "search")
               }
            }

            ToolbarItem(placement: .topBarTrailing) {
               Button {
                  presentationMode.wrappedValue.dismiss()
               } label: {
                  ToolBarFrame(image: "logout")
               }
            }
         }
      }
      .navigationBarBackButtonHidden(true)
   }
}

#Preview {
   ProfileView()
}
