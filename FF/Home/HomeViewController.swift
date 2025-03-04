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
               PushButtonFrame(image: "add")
            }
         }
         .padding(10)

         .background(Colors.primaryColor)
         
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
               Colors.primaryColor
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
         HStack(alignment: .top, spacing: 8) {
            NavigationLink {
               ProfileView()
            } label: {
               ProfileImageFrame(text: "A")
            }

            VStack(alignment: .leading, spacing: 4) {
               HStack(spacing: 8) {
                  NavigationLink {
                     // action post view
                  } label: {
                     TitleSubtitleTextFrame(titleText: "Andrii M.", subText: "@ffdossa")
                  }

                  Spacer()

                  Button {
                     // ACTION SETTINGS MENU POST
                  } label: {
                     Image("menu-dots")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .tint(Colors.grayColor)
                  }
               }

               NavigationLink {
                  // action post view
               } label: {
                  PrimaryText(text: "Some more text here. Some more text here. Some more text here. Some more text here. Some more text here. Some more text here.")

               }

               ChipsView {
                  ForEach(viewModel.allImages.indices, id: \.self) { index in
                     GridImageView(index: index)
                  }
               }

               HStack(spacing: 12) {
                  NavigationLink {
                     // actions
                  } label: {
                     PostButtonTextImageFrame(image: "chat", text: "11k")
                  }

                  NavigationLink {
                     // actions
                  } label: {
                     PostButtonTextImageFrame(image: "repost", text: "22k")
                  }

                  Button {
                     // actions
                  } label: {
                     PostButtonTextImageFrame(image: "heart", text: "33k")
                  }

                  NavigationLink {
                     // actions
                  } label: {
                     PostButtonTextImageFrame(image: "chart", text: "44k")
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
         }
      }
   }
}

#Preview {
   NavigationView {
      HomeView()
   }
}




