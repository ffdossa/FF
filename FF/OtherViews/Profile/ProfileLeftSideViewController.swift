//
//  File.swift
//  FF
//
//  Created by Andrii Marchuk on 28.02.2025.
//

import UIKit
import SwiftUI

class ProfileLeftSideViewController: UIViewController {

   var profileView = ProfileLeftSideView()

   override func viewDidLoad() {
      super.viewDidLoad()

      profileView.setupHostingController(self)
   }

}

struct ProfileLeftSideView: View {

   var body: some View {
      VStack {
         
      }

   }
}
