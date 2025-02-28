//
//  TabBarViewController.swift
//  FF
//
//  Created by Andrii Marchuk on 26.02.2025.
//

import UIKit
import SwiftUI

class MainViewController: UIViewController {

   var mainView = MainView()

   override func viewDidLoad() {
      super.viewDidLoad()

      mainView.setupHostingController(self)
   }
}

// MARK: View

struct MainView: View {
   var body: some View {
      NavigationView {
         TabView() {
            HomeView()
               .tabItem {
                  TabbarImageView(image: Image("home"))
               }

            SearchView()
               .tabItem {
                  TabbarImageView(image: Image("search"))
               }

            NotificationView()
               .tabItem {
                  TabbarImageView(image: Image("notification"))
               }

            DirectView()
               .tabItem {
                  TabbarImageView(image: Image("direct"))
               }
         }
         .accentColor(Colors.whiteColor)
      }
   }
}

struct TabbarImageView: View {
   var image: Image

   var body: some View {
      image
         .resizable()
         .frame(width: 24, height: 24)
   }
}

#Preview {
   MainView()
}
