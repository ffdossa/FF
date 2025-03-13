//
//  SearchViewController.swift
//  FF
//
//  Created by Andrii Marchuk on 26.02.2025.
//

import UIKit
import SwiftUI

class SearchViewController: UIViewController {

   var searchView = SearchView()

   override func viewDidLoad() {
      super.viewDidLoad()

      searchView.setupHostingController(self)
   }
}

// MARK: View

struct SearchView: View {
   @FocusState private var isSearching: Bool
   @State private var searchText: String = ""
   @State private var selectedTab: SearchTab = .all
   @Environment(\.colorScheme) private var scheme

   var body: some View {
      ScrollView(.vertical) {

         LazyVStack(spacing: 16) {

         }

         .safeAreaPadding(16)
         .safeAreaInset(edge: .top, spacing: 0) {
            SearchNavigationBar()
         }
         .animation(.snappy(duration: 0.3, extraBounce: 0), value: isSearching)
      }
      //      .scrollTargetBehavior(CustomScrollTargets())
      .background(Colors.darkBlackColor)
      .contentMargins(.top, 190, for: .scrollIndicators)
   }

   @ViewBuilder
   func SearchNavigationBar() -> some View {
      GeometryReader { proxy in
         let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
         //         let scrollViewHeight = proxy.bounds(of: .scrollView(axis: .vertical))?.height ?? 0
         //         let scaleProgress = minY > 0 ? 1 + (max(min(minY / scrollViewHeight, 1), 0) * 0.5) : 1
         let progress = isSearching ? 1 : max(min(-minY / 70, 1), 0)

         VStack(spacing: 12) {
            HStack(spacing: 12) {
               Image("search")
                  .foregroundStyle(Colors.whiteColor)

               TextField("", text: $searchText, prompt: Text("Search for people, posts, tags...")
                  .font(Fonts.regularFont)
                  .foregroundStyle(Colors.lighterGrayWhite))
                  .focused($isSearching)
                  .padding(.vertical, 12)

               if isSearching {
                  Button(action: {
                     isSearching = false
                  }) {
                     Image("close")
                        .tint(Colors.lighterGrayWhite)
                  }
                  .transition(.asymmetric(insertion: .push(from: .bottom), removal: .push(from: .top)))
               }
            }
            .foregroundStyle(Colors.whiteColor)
            .tint(Colors.pinkColor)
            .padding(.horizontal, 16 - (progress * 16))
            .background {
               RoundedRectangle(cornerRadius: 24 - (progress * 24))
                  .fill(Colors.whiteColor.opacity(0.1))
                  .padding(.top, -progress * 100)
                  .padding(.bottom, -progress * 60)
                  .padding(.horizontal, -progress * 16)
            }

            ScrollView(.horizontal) {
               HStack(spacing: 12) {
                  ForEach(SearchTab.allCases, id: \.rawValue) { tab in
                     Button(action: {
                        withAnimation(.snappy) {
                           selectedTab = tab
                        }
                     }) {
                        ZStack {
                           if selectedTab == tab {
                              Capsule()
                                 .fill(Colors.pinkColor)
                           } else {
                              Capsule()
                                 .fill(Colors.lighterGrayWhite.opacity(0.1))
                           }
                           Text(tab.rawValue)
                              .font(selectedTab == tab ? Fonts.basicSemiboldFont : Fonts.basicRegularFont)
                              .foregroundStyle(selectedTab == tab ? (scheme == .dark ? Colors.whiteColor : .white) : Colors.lighterGrayWhite)
                              .padding(.horizontal, 16)
                              .padding(.vertical, 8)
                        }
                     }
                  }
               }
            }
            .scrollIndicators(.hidden)
         }
         .padding(.top, 24)
         .safeAreaPadding(.horizontal, 16)
         .offset(y: minY < 0 || isSearching ? -minY : 0)
         .offset(y: -progress * 30)
      }
      .frame(height: 100)
      .padding(.bottom, 12)
      .padding(.bottom, isSearching ? -60 : 0)
   }
}

//struct CustomScrollTargets: ScrollTargetBehavior {
//   func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
//      if target.rect.minY < 70 {
//         if target.rect.minY < 35 {
//            target.rect.origin = .zero
//         } else {
//            target.rect.origin = .init(x: 0, y: 70)
//         }
//      }
//   }
//}

#Preview {
   SearchView()
}
