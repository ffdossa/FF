//
//  NewItemViewModel.swift
//  FF
//
//  Created by Andrii Marchuk on 27.02.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore



class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var showAlert = false

    init() { }

   func saveNewItem() {
       guard canSaveItem else {
           showAlert = true
           return
       }
       guard let uId = Auth.auth().currentUser?.uid else {
           showAlert = true
           return
       }

       let newId = UUID().uuidString
       let newItem = ItemModel(id: newId, title: title, createDate: Date().timeIntervalSince1970, isDone: false)
       let db = Firestore.firestore()

       db.collection("users")
           .document(uId)
           .collection("itemsList")
           .document(newId)
           .setData(newItem.asDictionary()) { error in
               if error != nil {
                   self.showAlert = true
               }
           }
   }

    var canSaveItem: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }

        return true
    }
}
