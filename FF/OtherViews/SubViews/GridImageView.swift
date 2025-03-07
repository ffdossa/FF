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
            if index <= 2 {
               Image(viewModel.allImages[index])
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: getWidth(index: index), height: getHeight(index: index))
                  .cornerRadius(8)
                  .clipped()
            }

            // Show the count of remaining images
            if viewModel.allImages.count > 4 && index == 3 {
               RoundedRectangle(cornerRadius: 8)
                  .fill(Colors.lighterGrayWhite.opacity(0.4))
                  .frame(width: getWidth(index: index), height: getHeight(index: index))

               let remainingImages = viewModel.allImages.count - 4
               Text("+\(remainingImages)")
                  .font(Fonts.titleFont)
                  .foregroundColor(Colors.whiteColor)
            }
         }
      })
   }

   func getWidth(index: Int) -> CGFloat {
       let totalWidth = rect.width - 32
       let imageCount = min(viewModel.allImages.count, 4)

       switch imageCount {
       case 1:
           return totalWidth // Full width for single image
       case 2:
           return totalWidth / 2 // Split evenly for 2 images
       case 3:
           if index == 0 {
               return totalWidth / 2 // Left image takes half
           } else {
               return totalWidth / 2 // Right side images take half together
           }
       case 4:
           return totalWidth / 2 // Each image takes half width
       default:
           return totalWidth / 2 // Fallback (shouldn't occur)
       }
   }

   // Calculate height based on number of images
   func getHeight(index: Int) -> CGFloat {
       let imageCount = min(viewModel.allImages.count, 4)

       switch imageCount {
       case 1, 2:
           return 235 // Full height for 1 or 2 images
       case 3:
           if index == 0 {
               return 235 // Left image takes full height
           } else {
               return 113.5 // Right side images split height (235 - 8 spacing) / 2
           }
       case 4:
           return 113.5 // Each image gets half height (235 - 8 spacing) / 2
       default:
           return 235 // Fallback
       }
   }
}

extension View {
   var rect: CGRect {
      UIScreen.main.bounds
   }
}
