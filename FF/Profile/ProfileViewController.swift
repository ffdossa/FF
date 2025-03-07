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
         VStack(alignment: .center) {
            ProfileHeaderView()
               .padding(.bottom, 75)
            VStack(alignment: .leading, spacing: 16) {
               VStack(alignment: .leading, spacing: 2) {
                  HStack(alignment: .center) {
                     Text("Andrii Marchuk")
                        .font(Fonts.titleRegularFont)
                        .foregroundStyle(Colors.whiteColor)

                     Text("@ffdossa")
                        .font(Fonts.hashMediumFont)
                        .foregroundStyle(Colors.lighterGrayWhite)
                  }

                  ButtonTextFrame(text: "Kyiv, Ukraine")

               }

               HStack() {
                  Button {
                     // FOLLOWING BUTTON
                  } label: {
                     ProfileFollowFrame(countText: "11,231",
                                        text: "Following")
                  }

                  Button {
                     // FOLLOWERS BUTTON
                  } label: {
                     ProfileFollowFrame(countText: "22,213",
                                        text: "Followers")
                  }
               }

               ProfileSectionView()

               ZStack(alignment: .bottomTrailing) {
                  PostScrollView()

                  Button {
                     viewModel.showingNewItemView = true
                  } label: {
                     PushButtonFrame(image: "plus")
                  }
                  .padding(.bottom)
               }
            }
            .padding(.horizontal)
         }
         .background(Colors.darkBlackColor)
         .contentMargins(.top, 190, for: .scrollIndicators)

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
               Colors.darkBlackColor
                  .opacity(viewModel.bgOpacity)
                  .ignoresSafeArea()

               ImageView()
            }
         }
      )
      .environmentObject(viewModel)

      .navigationBarBackButtonHidden(true)
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
                     .font(Fonts.hashMediumFont)
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
}

struct ProfileHeaderView: View {
   var body: some View {
      ZStack(alignment: .bottom) {
         Colors.lighterGrayWhite.opacity(0.2)
            .ignoresSafeArea()
         HStack(alignment: .bottom) {
            Text("A")
               .font(Fonts.titleFont)
               .foregroundStyle(Colors.whiteColor)
               .background() {
                  RoundedRectangle(cornerRadius: 30)
                     .fill(Colors.random())
                     .frame(width: 75, height: 75)
                     .overlay(RoundedRectangle(cornerRadius: 30).stroke(Colors.darkBlackColor, lineWidth: 4))
               }

            Spacer()

            Button {
               // FOLLOW,FOLLOWWING, EDIT PROFILE
            } label: {
               Text("Edit Profile")
                  .font(Fonts.countSemiboldFont)
                  .foregroundStyle(Colors.whiteColor)
                  .padding(.horizontal, 12)

                  .background() {
                     RoundedRectangle(cornerRadius: 12)
                        .fill(Colors.lighterGrayWhite.opacity(0.2))
                        .frame(width: .infinity, height: 30)
                  }
            }
            .padding(.top, 20)
         }
//
         .padding(.trailing, 16)
         .padding(.leading, 40)
         .offset(y: 35)
      }
      .frame(height: 12)
   }
}

struct ProfileFollowFrame: View {
   var countText: String
   var text: String

   var body: some View {
      HStack(alignment: .center, spacing: 4) {
         Text(countText)
            .font(Fonts.countSemiboldFont)
            .foregroundStyle(Colors.whiteColor)

         Text(text)
            .font(Fonts.countRegularFont)
            .foregroundStyle(Colors.lighterGrayWhite)

      }
   }
}


#Preview {
   ProfileView()
}


//                  PrimaryText(text: "Some more text here.")

//                  PostButtonTextImageFrame(image: "work",
//                                           text: "iOS Developer/iOS Developer/iOS Developer")
//
//                  Link(destination: URL(string: "https://github.com/ffdossa")!) {
//                     PostButtonTextImageFrame(image: "link",
//                                              text: "https://github.com/ffdossa")
//                  }
