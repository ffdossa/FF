//
//  GridImageView.swift
//  FF
//
//  Created by Andrii Marchuk on 01.03.2025.
//

import SwiftUI

struct GridImageView: View {
   @EnvironmentObject var viewModel: HomeViewModel
   var index: Int

   var body: some View {
      Button(action: {
         withAnimation(.easeInOut) {
            // For page tab view automatic scrolling
            viewModel.selectedImageID = viewModel.allImages[index]
            viewModel.showImageViewer.toggle()
         }
      }, label: {
         ZStack {
            // Show only four grids
            if index <= 3 {
               Image(viewModel.allImages[index])
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: getWidth(index: index), height: 96)
                  .cornerRadius(8)
            }

            // Show the count of remaining images
            if viewModel.allImages.count > 4 && index == 3 {
               RoundedRectangle(cornerRadius: 8)
                  .fill(Colors.grayColor.opacity(0.2))

               let remainingImages = viewModel.allImages.count - 4
               Text("+\(remainingImages)")
                  .font(.title)
                  .bold()
                  .foregroundColor(Colors.whiteColor)
            }
         }
      })
   }

   // Expand image size when space is availble
   func getWidth(index: Int) -> CGFloat {
      let width = rect.width - 88
      if viewModel.allImages.count % 2 == 0 {
         return width / 2
      } else {
         if index == viewModel.allImages.count - 1 {
            return width + 8
         } else {
            return width / 2
         }
      }
   }
}

extension View {
   var rect: CGRect {
      UIScreen.main.bounds
   }
}
