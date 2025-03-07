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
            PostScrollView()

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
                  ProfileToolbarButtonFrame(text: "F")
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

// MARK: SubView

struct PostScrollView: View {
   @StateObject var viewModel = HomeViewModel(userId: "")

   var body: some View {
      ScrollView(.vertical) {
         ForEach(0..<10, id:\.self) { _ in
            Divider()
            VStack(alignment: .leading, spacing: 16) {
               HStack(spacing: 8) {
                  NavigationLink {
                     ProfileView()
                  } label: {
                     ProfileImageFrame(text: "A")
                  }

                  NavigationLink {
                     // action post view
                  } label: {
                     TitleSubtitleTextFrame(titleText: "FFDOSSA",
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
                  PrimaryText(text: "Some more text here. Some more text here. Some more text here. Some more text here. Some more text here. Some more text here.")

               }

               GridLayoutView()

               HStack(spacing: 16) {
                  NavigationLink {
                     // actions
                  } label: {
                     PostButtonTextImageFrame(image: "chat",
                                              text: "11k")
                  }

                  NavigationLink {
                     // actions
                  } label: {
                     PostButtonTextImageFrame(image: "repost",
                                              text: "22k")
                  }

                  Button {
                     // actions
                  } label: {
                     PostButtonTextImageFrame(image: "heart",
                                              text: "33k")
                  }

                  NavigationLink {
                     // actions
                  } label: {
                     PostButtonTextImageFrame(image: "chart",
                                              text: "44k")
                  }

                  Spacer()

                  Button {
                     // action
                  } label: {
                     PostButtonImage(image: "bookmark")
                  }

                  ShareLink(item: URL(string: "https://github.com/ffdossa")!) {
                     PostButtonImage(image: "share")
                  }
               }
            }
            .padding(.top)
         }
      }
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




