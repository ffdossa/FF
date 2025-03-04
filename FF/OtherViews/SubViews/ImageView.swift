//
//  ImageView.swift
//  FF
//
//  Created by Andrii Marchuk on 01.03.2025.
//

import SwiftUI

struct ImageView: View {
   @EnvironmentObject var viewModel: HomeViewModel
   @GestureState var draggingOffset: CGSize = .zero

   var body: some View {
      ZStack {
         ScrollView(.init()) {
            TabView(selection: $viewModel.selectedImageID, content:  {
               ForEach(viewModel.allImages, id: \.self) { image in
                  Image(image)
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .tag(image)
                     .scaleEffect(viewModel.selectedImageID == image ? (viewModel.imageScale > 1 ? viewModel.imageScale : 1) : 1)
                  // Move only image for smooth animation
                     .offset(y: viewModel.imageViewerOffset.height)
                     .gesture(
                        // Magnify gesture
                        MagnificationGesture()
                           .onChanged({ value in
                              viewModel.imageScale = value
                           })
                           .onEnded({ _ in
                              withAnimation(.spring()) {
                                 viewModel.imageScale = 1
                              }
                           })
                        // Double to zoom
                           .simultaneously(with: TapGesture(count: 2).onEnded({ _ in
                              withAnimation {
                                 viewModel.imageScale = viewModel.imageScale > 1 ? 1 : 4
                              }
                           }))
                     )
               }
            })
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .overlay(
               Button(action: {
                  withAnimation(.default) {
                     viewModel.showImageViewer.toggle()
                  }
               }, label: {
                  ToolbarButtonFrame(image: "close")
               })
               .padding(8)
               .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
               .opacity(viewModel.bgOpacity), alignment: .topTrailing)
         }
         .ignoresSafeArea()
      }
      .gesture(
         DragGesture()
            .updating($draggingOffset, body: { value, outValue, _ in
               outValue = value.translation
               viewModel.onChange(value: draggingOffset)
            })
            .onEnded(viewModel.onEnd(value:))
      )
      .transition(.move(edge: .bottom))
      .toolbar(.hidden, for: .tabBar)
      .toolbar(.hidden, for: .navigationBar)
   }
}
