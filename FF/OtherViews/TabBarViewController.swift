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

struct MainView: View {

   @State private var offset: CGFloat = 0
   @State private var lastDragOffser: CGFloat = 0
   @State private var progress: CGFloat = 0

   var body: some View {
      GeometryReader { proxy in
         let size = proxy.size
         let sideBarWidth = size.width * (2 / 3)

         ZStack(alignment: .leading) {
            SideBarView()
               .frame(width: sideBarWidth)
               .offset(x: -sideBarWidth)
               .offset(x: offset)

            TabView() {
               HomeView()
                  .tabItem {
                     Image("home")
                  }


               SearchView()
                  .tabItem {
                     Image("search")
                  }

               NotificationView()
                  .tabItem {
                     Image("notification")
                  }

               DirectView()
                  .tabItem {
                     Image("direct")
                  }
            }
            .overlay {
               Rectangle()
                  .fill(Colors.grayColor.opacity(0.8))
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
}

#Preview {
   MainView()
}
