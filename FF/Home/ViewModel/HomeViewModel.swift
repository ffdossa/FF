//
//  HomeViewModel.swift
//  FF
//
//  Created by Andrii Marchuk on 27.02.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class HomeViewModel: ObservableObject {
   @Published var showingNewItemView = false

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
}
