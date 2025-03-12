//
//  Colors.swift
//  FF
//
//  Created by Andrii Marchuk on 23.02.2025.
//

import Foundation
import SwiftUI

enum Colors {
   static let whiteColor = Color.init(hexString: "#ECEBED")
   static let darkBlackColor = Color.init(hexString: "#181A1C")
   static let socialWhiteColor = Color.init(hexString: "#ECEBED")
   static let lighterGrayWhite = Color.init(hexString: "#C6C6C6")
   static let pinkColor = Color.init(hexString: "#AC1AF0")


   static func random() -> Color {
       return Color(
           red: .random(in: 0...1),
           green: .random(in: 0...1),
           blue: .random(in: 0...1)
       )
   }
}
