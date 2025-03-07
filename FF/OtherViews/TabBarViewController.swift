//
//  TabBarViewController.swift
//  FF
//
//  Created by Andrii Marchuk on 26.02.2025.
//

import UIKit
import SwiftUI

class TabBarViewController: UIViewController {

   var tabView = MainView()

   override func viewDidLoad() {
      super.viewDidLoad()

      tabView.setupHostingController(self)
   }
}

// MARK: View

//enum TabBar: String, CaseIterable {
//   case home = "home"
//   case search = "search"
//   case direct = "direct"
//   case notification = "notification"
//
//   var imageFill: String {
//      switch self {
//      case .home:
//         return "home.fill"
//      case .search:
//         return "search.fill"
//      case .direct:
//         return "direct.fill"
//      case .notification:
//         return "notification.fill"
//      }
//   }
//}

struct MainView: View {
   @State private var selectedTab: Int = 0
   @State private var offset: CGFloat = 0
   @State private var lastDragOffser: CGFloat = 0
   @State private var progress: CGFloat = 0

   var body: some View {
      GeometryReader { proxy in
         let size = proxy.size
         let sideBarWidth = size.width * (2.5 / 3)

         ZStack(alignment: .leading) {
            SideBarView()
               .frame(width: sideBarWidth)
               .offset(x: -sideBarWidth)
               .offset(x: offset)

            TabView(selection: $selectedTab) {
               HomeView()
                  .tabItem {
                     Image(selectedTab == 0 ? "home.fill" : "home")
                  }
                  .tag(0)

               SearchView()
                  .tabItem {
                     Image(selectedTab == 1 ? "search.fill" : "search")
                  }
                  .tag(1)

               DirectView()
                  .tabItem {
                     Image(selectedTab == 2 ? "direct.fill" : "direct")
                  }
                  .tag(2)

               NotificationView()
                  .tabItem {
                     Image(selectedTab == 3 ? "notification.fill" : "notification")
                  }
                  .tag(3)
            }
            .overlay {
               Rectangle()
                  .fill(Color.black.opacity(0.8))
                  .ignoresSafeArea()
                  .opacity(progress)
            }
            .offset(x: offset)
         }
         .gesture(DragGesture()
            .onChanged({ value in
               let translation = value.translation.width + lastDragOffser
               offset = max(min(translation, sideBarWidth), 0)
               progress = max(min(offset / sideBarWidth, 1), 0)
            }).onEnded({ value in
               let velocity = value.translation.width / 3

               withAnimation(.snappy(duration: 0.3, extraBounce: 0)) {
                  if (velocity + offset) > (sideBarWidth * 0.5) {
                     offset = sideBarWidth
                     progress = 1
                  } else {
                     offset = 0
                     progress = 0
                  }
               }
               lastDragOffser = offset
            })
         )
         .accentColor(Colors.whiteColor)
      }
   }

//   @ViewBuilder
//   func TabBarActionButton(value: TabBar, action: @escaping () -> ()) -> some View {
//      Button(action: action) {
//         HStack(spacing: 30) {
//            Image(value.rawValue)
//               .resizable()
//               .frame(width: 24, height: 24)
//
//            Image(value.imageFill)
//               .resizable()
//               .frame(width: 24, height: 24)
//               .scaledToFit()
//               .scaleEffect(selectedTab == 3 ? 1.3 : 1.0)
//               .animation(.easeInOut(duration: 0.2), value: selectedTab)
//         }
//         .foregroundStyle(Colors.whiteColor)
//      }
//   }
}

#Preview {
   MainView()
}
