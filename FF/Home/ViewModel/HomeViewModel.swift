//
//  HomeViewModel.swift
//  FF
//
//  Created by Andrii Marchuk on 27.02.2025.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class HomeViewModel: ObservableObject {
   @Published var showingNewItemView = false

   @Published var showImageViewer = false
   @Published var selectedImageID: String = ""
   @Published var imageViewerOffset: CGSize = .zero
   @Published var bgOpacity: Double = 1
   @Published var imageScale: CGFloat = 1
   @Published var allImages: [String] = ["image", "image", "image", "image", "image", "image"]

   private let userId: String

   init(userId: String) {
      self.userId = userId.isEmpty ? "unknown" : userId
   }

   func delete(id: String, completion: @escaping (Error?) -> Void) {
      let db = Firestore.firestore()
      db.collection("users")
         .document(userId)
         .collection("itemsList")
         .document(id)
         .delete { error in
            completion(error)
         }
   }
   // Image View
   func onChange(value: CGSize) {
      imageViewerOffset = value

      let halfHeight = UIScreen.main.bounds.height / 2
      let progress = imageViewerOffset.height / halfHeight

      withAnimation(.default) {
         bgOpacity = Double(1 - (progress < 0 ? -progress : progress))
      }
   }

   func onEnd(value: DragGesture.Value) {
      withAnimation(.easeInOut) {
         var translation = value.translation.height
         if translation < 0 {
            translation = -translation
         }
         if translation < 250 {
            imageViewerOffset = .zero
            bgOpacity = 1
         } else {
            showImageViewer.toggle()
            imageViewerOffset = .zero
            bgOpacity = 1
         }
      }
   }
}
