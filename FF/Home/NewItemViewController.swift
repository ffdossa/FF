//
//  NewItemViewController.swift
//  FF
//
//  Created by Andrii Marchuk on 27.02.2025.
//

import UIKit
import SwiftUI

class NewItemViewController: UIViewController {

   var newItemView = NewItemView(newItemPresented: Binding(get: {
      return true
   }, set: { _ in

   }))

   override func viewDidLoad() {
      super.viewDidLoad()

      newItemView.setupHostingController(self)
   }
}


struct NewItemView: View {
   @StateObject var viewModel = NewItemViewModel()
   @Binding var newItemPresented: Bool
   @State private var text = ""
   @FocusState private var isFocused: Bool

   var body: some View {
      VStack(alignment: .trailing) {
         HStack(alignment: .top, spacing: 8) {
            Button {
               // PUSH PROFILE
            } label: {
               ToolbarButtonFrame(image: "profile")
            }

            TextField("What's happening?", text: $viewModel.title, axis: .vertical)
               .focused($isFocused)
               .font(Fonts.primaryFont)
               .foregroundStyle(Colors.whiteColor)
               .lineLimit(8)
         }
         
         Spacer()

         Button {
            if viewModel.canSaveItem {
               viewModel.saveNewItem()
               newItemPresented = false
            } else {
               viewModel.showAlert = true
            }
         } label: {
            ButtonImageFrame(image: "arrow-up")
         }
      }
      .padding(12)

      .background(Colors.primaryColor)

      .alert(isPresented: $viewModel.showAlert) {
         Alert(title: Text("Sorry"),
               message: Text("Your post cannot be empty. Please enter some content before publishing."))
      }

      .onAppear {
         isFocused = true
      }
   }
}

#Preview {
   NewItemView(newItemPresented: Binding(get: {
      return true
   }, set: { _ in

   }))
}
