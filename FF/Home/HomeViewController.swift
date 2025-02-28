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
      ZStack(alignment: .bottomTrailing) {
         PostScrollView()

         Button {
            viewModel.showingNewItemView = true
         } label: {
            ImageButtonFrame(image: "add")
         }
      }

      .padding(12)

      .background(Colors.primaryColor)

      .toolbar {
         ToolbarItem(placement: .topBarLeading) {
            NavigationLink {
               ProfileLeftSideView()
            } label: {
               ToolBarFrame(image: "profile")
            }
         }

         ToolbarItem(placement: .topBarTrailing) {
            Button {
               // ACTION LOGOUT
            } label: {
               ToolBarFrame(image: "logout")
            }
         }
      }

      .sheet(isPresented: $viewModel.showingNewItemView) {
         NewItemView(newItemPresented: $viewModel.showingNewItemView)
      }
   }
}

// MARK: SubView

struct PostScrollView: View {
   var body: some View {
      ScrollView(.vertical) {
         HStack(alignment: .top, spacing: 8) {
            NavigationLink {
               ProfileView()
            } label: {
               ImageButtonFrame(image: "profile")
            }

            VStack(alignment: .leading, spacing: 4) {
               HStack(spacing: 8) {
                  NavigationLink {
                     // action post view
                  } label: {
                     TextFrameView(titleText: "Andrii M.", subText: "@ffdossa")
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
                  TextPrimaryFrame(text: "BREAKING: Romanian prosecutors found 10 million $ in cash burried in an underground safe at the house of Calin Georgescu's bodyguard.")
               }

               // some preview photo or video and push view


               HStack(spacing: 12) {
                  NavigationLink {
                     // actions
                  } label: {
                     TextImageFrame(image: "chat", text: "11k")
                  }

                  NavigationLink {
                     // actions
                  } label: {
                     TextImageFrame(image: "repost", text: "22k")
                  }

                  Button {
                     // actions
                  } label: {
                     TextImageFrame(image: "heart", text: "33k")
                  }

                  NavigationLink {
                     // actions
                  } label: {
                     TextImageFrame(image: "chart", text: "44k")
                  }

                  Spacer()

                  Button {
                     // action
                  } label: {
                     LightImageFrame(image: "bookmark")
                  }

                  ShareLink(item: URL(string: "https://github.com/ffdossa")!) {
                     LightImageFrame(image: "share")
                  }
               }
            }
         }
      }
   }
}

struct TextPrimaryFrame: View {
   var text: String

   var body: some View {
      Text(text)
         .multilineTextAlignment(.leading)
         .font(Fonts.primaryFont)
         .foregroundStyle(Colors.whiteColor)
   }
}

struct TextFrameView: View {
   var titleText: String
   var subText: String

   var body: some View {
      Text(titleText)
         .font(Fonts.primaryFont)
         .bold()
         .foregroundStyle(Colors.whiteColor)

      Text(subText)
         .font(Fonts.primaryFont)
         .foregroundStyle(Colors.grayColor)
   }
}

struct ImageButtonFrame: View {
   var image: String

   var body: some View {
      ZStack {
         RoundedRectangle(cornerRadius: 16)
            .fill(Colors.whiteColor)
            .frame(width: 48, height: 48)
         Image(image)
            .resizable()
            .frame(width: 32, height: 32)
            .tint(Colors.primaryColor)
      }
   }
}

struct TextImageFrame: View {
   var image: String
   var text: String

   var body: some View {
      HStack {
         Image(image)
            .resizable()
            .frame(width: 16, height: 16)
            .tint(Colors.grayColor)

         Text(text)
            .font(Fonts.lightFont)
            .foregroundStyle(Colors.grayColor)
            .padding(.leading, -4)
      }
   }
}

struct LightImageFrame: View {
   var image: String

   var body: some View {
      Image(image)
         .resizable()
         .frame(width: 16, height: 16)
         .tint(Colors.grayColor)
   }
}

#Preview {
   NavigationView {
      HomeView()
   }
}




