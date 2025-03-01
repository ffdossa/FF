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
         VStack(alignment: .leading, spacing: 18) {
            //            ZStack(alignment: .bottomLeading) {
            //               ZStack {
            //                  RoundedRectangle(cornerRadius: 24)
            //                     .fill(Colors.whiteColor)
            //                     .frame(width: 72, height: 72)
            //
            //                  Image("profile")
            //                     .resizable()
            //                     .frame(width: 48, height: 48)
            //               }
            //               .padding(.leading, 12)
            //            }

            VStack(alignment: .leading, spacing: 12) {
               VStack(alignment: .leading) {
                  Text("FFDOSSA")
                     .font(.title2)
                     .foregroundStyle(Colors.whiteColor)
                     .bold()

                  Text("@ffdossa")
                     .font(Fonts.primaryFont)
                     .foregroundStyle(Colors.grayColor)
               }

               PrimaryText(text: "Some more text here. Some more text here. Some more text here. Some more text here. Some more text here. Some more text here.")

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
                     ButtonImageFrame(image: "add")
                  }
               }
            }
         }
         .padding(12)

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
                  presentationMode.wrappedValue.dismiss()
               } label: {
                  ToolbarButtonFrame(image: "search")
               }
            }

            ToolbarItem(placement: .topBarTrailing) {
               Button {
                  presentationMode.wrappedValue.dismiss()
               } label: {
                  ToolbarButtonFrame(image: "logout")
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
                  .toolbar(.hidden, for: .tabBar)
            }
         }
      )
      .environmentObject(viewModel)

      .navigationBarBackButtonHidden(true)
   }
}

struct FollowButtonFrame: View {
   var countText: String
   var text: String

   var body: some View {
      HStack {
         Text(countText)
            .font(Fonts.lightFont)
            .bold()
            .foregroundStyle(Colors.whiteColor)

         Text(text)
            .font(Fonts.lightFont)
            .foregroundStyle(Colors.grayColor)
            .padding(.leading, -4)
      }
   }
}

#Preview {
   ProfileView()
}
