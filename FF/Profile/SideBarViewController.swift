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
   case direct = "Messages"
   case notification = "Notifications"
   case bookmarks = "Bookmarks"
   case settings = "Settings"

   var image: String {
      switch self {
      case .profile:
         return "profile"
      case .communities:
         return "communities"
      case .direct:
         return "direct"
      case .notification:
         return "notification"
      case .bookmarks:
         return "bookmark"
      case .settings:
         return "setting"
      }
   }
}

struct SideBarView: View {

   var body: some View {
      VStack(alignment: .leading, spacing: 16) {
         HStack(alignment: .center, spacing: 12) {
            ZStack {
               Circle()
                  .fill(Color.black.opacity(0.4))
                  .frame(width: 72, height: 72)

               Image("profile")
                  .resizable()
                  .frame(width: 48, height: 48)
                  .foregroundStyle(Colors.whiteColor)
            }

            VStack(alignment: .leading, spacing: 4) {
               Text("Steve Aoki")
                  .font(Fonts.titleSemiboldFont)
                  .foregroundStyle(Colors.whiteColor)

               Text("+380(12)-345-67-89")
                  .font(Fonts.hashRegularFont)
                  .foregroundStyle(Colors.lighterGrayWhite)

               Text("@ffdossa")
                  .font(Fonts.hashRegularFont)
                  .foregroundStyle(Colors.lighterGrayWhite)
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
      .padding(.top)
      .padding(.leading, 32)
      .padding(.trailing)

      .background(Colors.darkBlackColor)

      .scrollIndicators(.hidden)
   }

   @ViewBuilder
   func SideBarActionButton(value: SideBarAction, action: @escaping () -> ()) -> some View {
      Button(action: action) {
         HStack(spacing: 32) {
            Image(value.image)
               .resizable()
               .frame(width: 24, height: 24)

            Text(value.rawValue)
               .font(Fonts.subtitleRegularFont)
         }
         .foregroundStyle(Colors.whiteColor)
      }
   }
}

#Preview {
   SideBarView()
}
