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
      NavigationStack {

         VStack(alignment: .leading, spacing: 64) {
            ProfileHeaderView()
            VStack(alignment: .leading, spacing: 12) {
               VStack(alignment: .leading) {
                  Text("FFDOSSA")
                     .font(.title2)
                     .foregroundStyle(Colors.whiteColor)
                     .bold()

                  Text("@ffdossa")
                     .font(Fonts.basicRegularFont)
                     .foregroundStyle(Colors.grayColor)
               }

               PrimaryText(text: "Some more text here.")

               ChipsView {
                  PostButtonTextImageFrame(image: "work",
                                           text: "iOS Developer/iOS Developer/iOS Develope")
                  PostButtonTextImageFrame(image: "location",
                                           text: "Ukraine")

                  Link(destination: URL(string: "https://github.com/ffdossa")!) {
                     PostButtonTextImageFrame(image: "link",
                                              text: "https://github.com/ffdossa")
                  }

                  PostButtonTextImageFrame(image: "calendar",
                                           text: "Joined December 2004")
               }

               HStack() {
                  Button {
                     // FOLLOWING BUTTON
                  } label: {
                     FollowButtonFrame(countText: "11k",
                                       text: "Following")
                  }

                  Button {
                     // FOLLOWERS BUTTON
                  } label: {
                     FollowButtonFrame(countText: "22k",
                                       text: "Followers")
                  }
               }

               Divider()

               ZStack(alignment: .bottomTrailing) {
                  PostScrollView()

                  Button {
                     viewModel.showingNewItemView = true
                  } label: {
                     PushButtonFrame(image: "add")
                  }
               }
            }
            .padding(10)
         }
         .background(Colors.primaryColor)

         .toolbar {
            ToolbarItem(placement: .topBarLeading) {
               Button {
                  presentationMode.wrappedValue.dismiss()
               } label: {
                  ToolbarButtonFrame(image: "close")
               }
            }

            ToolbarItem(placement: .topBarTrailing) {
               Button {
                  // search button
               } label: {
                  ToolbarButtonFrame(image: "search")
               }
            }

            ToolbarItem(placement: .topBarTrailing) {
               Button {
                  // share account
               } label: {
                  ToolbarButtonFrame(image: "share")
               }
            }
         }
      }

      .sheet(isPresented: $viewModel.showingNewItemView) {
         NewItemView(newItemPresented: $viewModel.showingNewItemView)
      }

      .overlay(
         ZStack {
            if viewModel.showImageViewer {
               Colors.primaryColor
                  .opacity(viewModel.bgOpacity)
                  .ignoresSafeArea()

               ImageView()
            }
         }
      )
      .environmentObject(viewModel)

      .navigationBarBackButtonHidden(true)
   }
}

struct ProfileHeaderView: View {
   var body: some View {
      VStack {
         ZStack(alignment: .bottomLeading) {
            Colors.secondaryColor
               .ignoresSafeArea()
            ZStack {
               RoundedRectangle(cornerRadius: 20)
                  .fill(Colors.random())
                  .frame(width: 60, height: 60)
                  .overlay(RoundedRectangle(cornerRadius: 24).stroke(Colors.primaryColor, lineWidth: 4))

               Text("A")
                  .font(Fonts.subtitleFont)
                  .foregroundStyle(Colors.whiteColor)
            }
            .offset(x: 10, y: 40)
         }
      }
      .frame(height: 12)
   }
}

struct FollowButtonFrame: View {
   var countText: String
   var text: String

   var body: some View {
      HStack {
         Text(countText)
            .font(Fonts.secondMediumFont)
            .foregroundStyle(Colors.whiteColor)

         Text(text)
            .font(Fonts.secondRegularFont)
            .foregroundStyle(Colors.grayColor)
            .padding(.leading, -4)
      }
   }
}

#Preview {
   ProfileView()
}
