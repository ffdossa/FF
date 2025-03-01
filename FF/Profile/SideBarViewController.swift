//
//  File.swift
//  FF
//
//  Created by Andrii Marchuk on 28.02.2025.
//

import UIKit
import SwiftUI

class SideBarViewController: UIViewController {

   var profileView = SideBarView()

   override func viewDidLoad() {
      super.viewDidLoad()

      profileView.setupHostingController(self)
   }

}

// MARK: View

enum SideBarAction: String, CaseIterable {
   case profile = "Profile"
   case communities = "Communities"
   case bookmarks = "Bookmarks"
   case jobs = "Jobs"
   case list = "Lists"
   case settings = "Settings"

   var image: String {
      switch self {
      case .profile:
         return "profile"
      case .communities:
         return "communities"
      case .bookmarks:
         return "bookmark"
      case .jobs:
         return "work"
      case .list:
         return "note"
      case .settings:
         return "setting"
      }
   }
}

struct SideBarView: View {

   var body: some View {
      VStack(alignment: .leading, spacing: 12) {
         ButtonImageFrame(image: "profile")

         VStack(alignment: .leading, spacing: 4) {
            Text("Andrii M.")
               .font(Fonts.boldPrimaryFont)
               .bold()
               .foregroundStyle(Colors.whiteColor)

            Text("@ffdossa")
               .font(Fonts.primaryFont)
               .foregroundStyle(Colors.grayColor)
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

         ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 24) {
               ForEach(SideBarAction.allCases, id: \.rawValue) { action in
                  SideBarActionButton(value: action) {

                  }
               }
            }
         }
      }
      .padding()

      .background(Colors.primaryColor)
      .scrollIndicators(.hidden)
   }

   @ViewBuilder
   func SideBarActionButton(value: SideBarAction, action: @escaping () -> ()) -> some View {
      Button(action: action) {
         HStack(spacing: 16) {
            Image(value.image)
               .resizable()
               .frame(width: 28, height: 28)

            Text(value.rawValue)
               .font(.title2)
               .bold()
         }
         .foregroundStyle(Colors.whiteColor)
      }
   }
}

#Preview {
   SideBarView()
}
