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
   @Environment(\.colorScheme) private var scheme
   @StateObject var viewModel = HomeViewModel(userId: "")
   @State private var selectedTab: ProfileState = .posts

   var body: some View {
      NavigationStack {
         ZStack(alignment: .bottomTrailing) {
            ScrollView(.vertical) {
               LazyVStack(alignment: .center, spacing: 12) {
                  ProfileHeaderView()

                  ProfileSectionView()
                     .padding(.bottom, -12)

                  Divider()

                  PostView()
                     .padding(.horizontal)
               }
            }

            Button {
               viewModel.showingNewItemView = true
            } label: {
               PushButtonFrame(image: "plus")
            }
            .padding(.bottom)
            .padding(.trailing)
         }
         .background(Colors.darkBlackColor)

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
         .navigationBarBackButtonHidden(true)
      }

      .sheet(isPresented: $viewModel.showingNewItemView) {
         NewItemView(newItemPresented: $viewModel.showingNewItemView)
      }

      .overlay(
         ZStack {
            if viewModel.showImageViewer {
               Colors.darkBlackColor
                  .opacity(viewModel.bgOpacity)
                  .ignoresSafeArea()

               ImageView()
            }
         }
      )

      .environmentObject(viewModel)
   }

   @ViewBuilder
   func ProfileSectionView() -> some View {
      HStack {
         ForEach(ProfileState.allCases, id: \.rawValue) { tab in
            Button(action: {
               withAnimation(.snappy) {
                  selectedTab = tab
               }
            }) {
               VStack {
                  Text(tab.rawValue)
                     .font(selectedTab == tab ? Fonts.hashSemiboldFont : Fonts.basicRegularFont)
                     .foregroundStyle(selectedTab == tab ? (scheme == .dark ? Colors.whiteColor : .white) : Colors.lighterGrayWhite)
                     .padding(.horizontal, 4)
                     .padding(.bottom, 12)

                     .background(alignment: .bottom) {
                        if selectedTab == tab {
                           RoundedRectangle(cornerRadius: 1.5)
                              .fill(Colors.pinkColor)
                              .frame(height: 3)
                        } else {
                           RoundedRectangle(cornerRadius: 1)
                              .fill(Colors.lighterGrayWhite.opacity(0.2))
                              .frame(height: 2)
                        }
                     }
                     .frame(maxWidth: .greatestFiniteMagnitude)
               }
            }
         }
      }
   }

   @ViewBuilder
   func ProfileHeaderView() -> some View {
      ZStack {
         Rectangle()
            .fill(Colors.lighterGrayWhite.opacity(0.1))
            .ignoresSafeArea()
            .offset(y: -144)
         VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .bottom) {
               TitleProfileImageFrame(image: "profile")

               Spacer()

               Button {
                  // FOLLOW,FOLLOWWING, EDIT PROFILE
               } label: {
                  Text("Edit Profile")
                     .font(Fonts.countMediumFont)
                     .foregroundStyle(Colors.whiteColor)
                     .padding(.horizontal, 16)
                     .padding(.vertical, 8)
                     .background() {
                        Capsule()
                           .fill(Colors.lighterGrayWhite.opacity(0.1))
                     }
               }
               .padding(.bottom, 12)
            }

            VStack(alignment: .leading, spacing: 2) {
               Text("Steve Aoki")
                  .font(Fonts.titleSemiboldFont)
                  .foregroundStyle(Colors.whiteColor)

               LocationTextFrame(text: "Los Angeles, United States")
            }

            HStack(spacing: 12) {
               Button {
                  // FOLLOWING BUTTON
               } label: {
                  ProfileFollowFrame(countText: "11,231",
                                     text: "Followers")
               }

               Button {
                  // FOLLOWERS BUTTON
               } label: {
                  ProfileFollowFrame(countText: "22,213",
                                     text: "Following")
               }
            }
         }
         .padding(.horizontal)
         .padding(.top, 8)
      }
   }
}

struct TitleProfileImageFrame: View {
   var image: String

   var body: some View {
      ZStack {
         Circle()
            .fill(Colors.pinkColor)
            .frame(width: 88, height: 88)
            .overlay(
               Circle()
                  .stroke(Colors.darkBlackColor, lineWidth: 4))

         Image(image)
            .resizable()
            .frame(width: 60, height: 60)
            .foregroundStyle(Colors.whiteColor)
      }
   }
}

#Preview {
   ProfileView()
}


//                     Text("@ffdossa")
//                        .font(Fonts.hashMediumFont)
//                        .foregroundStyle(Colors.lighterGrayWhite)

//                  PrimaryText(text: "Some more text here.")

//                  PostButtonTextImageFrame(image: "work",
//                                           text: "iOS Developer/iOS Developer/iOS Developer")
//
//                  Link(destination: URL(string: "https://github.com/ffdossa")!) {
//                     PostButtonTextImageFrame(image: "link",
//                                              text: "https://github.com/ffdossa")
//                  }
