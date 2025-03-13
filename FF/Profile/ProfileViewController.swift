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
                     .font(selectedTab == tab ? Fonts.basicSemiboldFont : Fonts.basicRegularFont)
                     .foregroundStyle(selectedTab == tab ? (scheme == .dark ? Colors.whiteColor : .white) : Colors.lighterGrayWhite)
                     .padding(.horizontal, 4)
                     .padding(.bottom, 12)

                     .background(alignment: .bottom) {
                        if selectedTab == tab {
                           RoundedRectangle(cornerRadius: 1.5)
                              .fill(Colors.pinkColor)
                              .frame(height: 3)
                        } else {
                           //                           RoundedRectangle(cornerRadius: 1)
                           //                              .fill(Colors.lighterGrayWhite.opacity(0.2))
                           //                              .frame(height: 2)
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
      VStack(alignment: .leading, spacing: 12) {
         HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 2) {
               HStack(alignment: .center, spacing: 8) {
                  Text("Michelle Ogilvy")
                     .font(Fonts.titleSemiboldFont)
                     .foregroundStyle(Colors.whiteColor)

                  Text("·")
                     .font(Fonts.titleSemiboldFont)
                     .foregroundStyle(Colors.lighterGrayWhite)

                  Text("@random")
                     .font(Fonts.basicRegularFont)
                     .foregroundStyle(Colors.lighterGrayWhite)
               }

               Text("Kyiv, Kyiv City, Ukraine")
                  .font(Fonts.basicMediumFont)
                  .foregroundStyle(Colors.lighterGrayWhite)
            }
            
            Spacer()

            ZStack {
               Circle()
                  .fill(Color.black.opacity(0.4))
                  .frame(width: 60, height: 60)

               Image("profile")
                  .resizable()
                  .frame(width: 40, height: 40)
                  .foregroundStyle(Colors.whiteColor)
            }


         }

         Text("iOS developer \nSoftware developer/Programmer/Software engineer \nSome text here")
            .multilineTextAlignment(.leading)
            .font(Fonts.hashRegularFont)
            .foregroundStyle(Colors.socialWhiteColor)

         HStack {
            HStack(spacing: 32) {
               Button {
                  // FOLLOWING BUTTON
               } label: {
                  FollowFrame(countText: "123.4K",
                              text: "Followers")
               }

               Button {
                  // FOLLOWERS BUTTON
               } label: {
                  FollowFrame(countText: "567,8K",
                              text: "Following")
               }
            }

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
                        .fill(Colors.pinkColor)
                  }
            }
         }
      }
      .padding(.horizontal)
      .padding(.top, 8)
   }

}


#Preview {
   ProfileView()
}




//                  Link(destination: URL(string: "https://github.com/ffdossa")!) {
//                     PostButtonTextImageFrame(image: "link",
//                                              text: "https://github.com/ffdossa")
//                  }
