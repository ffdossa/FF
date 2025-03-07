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
         return "jobs"
      case .list:
         return "note"
      case .settings:
         return "setting"
      }
   }
}

struct SideBarView: View {

   var body: some View {
      VStack(alignment: .leading, spacing: 10) {
         ProfileImageFrame(text: "A")

         VStack(alignment: .leading, spacing: 4) {
            Text("FFDOSSA")
               .font(Fonts.titleRegularFont)
               .foregroundStyle(Colors.whiteColor)

            Text("@ffdossa")
               .font(Fonts.basicRegularFont)
               .foregroundStyle(Colors.lighterGrayWhite)
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


         Divider()

         ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 26) {
               ForEach(SideBarAction.allCases, id: \.rawValue) { action in
                  SideBarActionButton(value: action) {
                     // ACTION
                  }
               }
            }
         }
      }
      .padding(.leading, 30)

      .background(Colors.darkBlackColor)

      .scrollIndicators(.hidden)
   }

   @ViewBuilder
   func SideBarActionButton(value: SideBarAction, action: @escaping () -> ()) -> some View {
      Button(action: action) {
         HStack(spacing: 30) {
            Image(value.image)
               .resizable()
               .frame(width: 24, height: 24)

            Text(value.rawValue)
               .font(Fonts.titleRegularFont)
         }
         .foregroundStyle(Colors.whiteColor)
      }
   }
}

#Preview {
   SideBarView()
}
