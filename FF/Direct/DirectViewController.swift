//
//  DirectViewController.swift
//  FF
//
//  Created by Andrii Marchuk on 26.02.2025.
//

import UIKit
import SwiftUI

class DirectViewController: UIViewController {

    var directView = DirectView()

    override func viewDidLoad() {
        super.viewDidLoad()

        directView.setupHostingController(self)
    }
}

// MARK: View

struct DirectView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DirectView()
}
