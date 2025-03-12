//
//  HomeViewController.swift
//  FF
//
//  Created by Andrii Marchuk on 26.02.2025.
//

import UIKit
import SwiftUI
import Foundation
import FirebaseAuth
import FirebaseFirestore

class HomeViewController: UIViewController {
   var homeView = HomeView()

   override func viewDidLoad() {
      super.viewDidLoad()

      homeView.setupHostingController(self)
   }
}

// MARK: View

struct HomeView: View {
   @StateObject var viewModel = HomeViewModel(userId: "")

   var body: some View {
      NavigationStack {
         ZStack(alignment: .bottomTrailing) {
            ScrollView(.vertical) {
               PostView()
            }

            Button {
               viewModel.showingNewItemView = true
            } label: {
               PushButtonFrame(image: "plus")
            }
            .padding(.bottom)
         }
         .padding(.horizontal)

         .background(Colors.darkBlackColor)

         .toolbar {
            ToolbarItem(placement: .topBarLeading) {
               NavigationLink {
                  ProfileView()
               } label: {
                  ToolbarButtonFrame(image: "profile")
               }
            }

            ToolbarItem(placement: .topBarTrailing) {
               Button {
                  // ACTION LOGOUT
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
               Colors.darkBlackColor
                  .opacity(viewModel.bgOpacity)
                  .ignoresSafeArea()

               ImageView()
            }
         }
      )

      .environmentObject(viewModel)
   }
}

// MARK: Sub View

struct PostView: View {
   @StateObject var viewModel = HomeViewModel(userId: "")

   var body: some View {
      VStack(alignment: .leading, spacing: 16) {
         HStack(spacing: 8) {
            NavigationLink {
               ProfileView()
            } label: {
               ProfileImageFrame(image: "profile")
            }

            NavigationLink {
               // action post view
            } label: {
               TitleSubtitleTextFrame(titleText: "Steve Aoki",
                                      subText: "@ffdossa")
            }

            Spacer()

            Button {
               // ACTION SETTINGS MENU POST
            } label: {
               Image("menu-dots")
                  .resizable()
                  .frame(width: 20, height: 20)
                  .tint(Colors.lighterGrayWhite)
            }
         }

         NavigationLink {
            // action post view
         } label: {
            PostText(text: "Some more text here. Some more text here. Some more text here. Some more text here. Some more text here. Some more text here.")

         }

         GridLayoutView()

         HStack(spacing: 16) {
            NavigationLink {
               // CHAT ACTION
            } label: {
               HStack {
                  BottomPostImage(image: "chat")
                  BottomTextFrame(text: "11")
               }
            }

            NavigationLink {
               // REPOST VIEW ACTION
            } label: {
               HStack {
                  BottomPostImage(image: "repost")
                  BottomTextFrame(text: "110")
               }
            }

            Button {
               // LIKES BUTTON ACTION
            } label: {
               HStack {
                  BottomPostImage(image: "heart")
                  BottomTextFrame(text: "1.1k")
               }
            }

            Spacer()

            Button {
               // PUSH ADD BOOKMARK ACTION
            } label: {
               BottomPostImage(image: "bookmark")
            }
            // SHARE LINK
            ShareLink(item: URL(string: "https://github.com/ffdossa")!) {
               BottomPostImage(image: "share")
            }
         }
      }
      .padding(.top, 8)
   }
}

struct GridLayoutView: View {
   @EnvironmentObject var viewModel: HomeViewModel

   var body: some View {
      if viewModel.allImages.count == 3 {
         HStack(spacing: 8) {
            GridImageView(index: 0)
            VStack(spacing: 8) {
               GridImageView(index: 1)
               GridImageView(index: 2)
            }
         }
         .frame(height: 235)
      } else {
         VStack(spacing: 8) {
            if viewModel.allImages.count >= 1 {
               HStack(spacing: 8) {
                  GridImageView(index: 0)
                  if viewModel.allImages.count >= 2 {
                     GridImageView(index: 1)
                  }
               }
            }
            if viewModel.allImages.count >= 3 {
               HStack(spacing: 8) {
                  GridImageView(index: 2)
                  if viewModel.allImages.count >= 4 {
                     GridImageView(index: 3)
                  }
               }
            }
         }
         .frame(height: viewModel.allImages.count <= 2 ? 235 : 235)
      }
   }
}

#Preview {
   NavigationView {
      HomeView()
   }
}




