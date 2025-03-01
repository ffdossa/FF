//
//  ChipsView.swift
//  FF
//
//  Created by Andrii Marchuk on 01.03.2025.
//

import SwiftUI

struct ChipsView<Content: View>: View {
   @ViewBuilder var content: Content

   var body: some View {
      if #available(iOS 18.0, *) {
         Group(subviews: content) { collection in
            let chunkedCollection = collection.chunkByWidth(24)

            VStack(alignment: .leading) {
               ForEach(chunkedCollection.indices, id: \.self) { index in
                  HStack(spacing: 8) {
                     ForEach(chunkedCollection[index]) { subview in
                        subview
                     }
                  }
               }
            }
         }
      } else {

      }
   }
}

extension String {
   func size(_ font: UIFont) -> CGSize {
      let attributes = [NSAttributedString.Key.font: font]
      return self.size(withAttributes: attributes)
   }
}


@available(iOS 18.0, *)
extension ContainerValues {
   @Entry var viewWidth: CGFloat = 0
}


@available(iOS 18.0, *)
extension SubviewsCollection {
   func chunkByWidth(_ containerWidth: CGFloat) -> [[Subview]] {
      var row: [Subview] = []
      var rowWidth: CGFloat = 0
      var rows: [[Subview]] = []
      let spacing: CGFloat = 8

      for subview in self {
         let viewWidth = subview.containerValues.viewWidth + spacing
         rowWidth += viewWidth

         if rowWidth < containerWidth {
            row.append(subview)
         } else {
            rows.append(row)
            row = [subview]
            rowWidth = viewWidth
         }
      }

      if !row.isEmpty {
         rows.append(row)
      }

      return rows
   }
}
